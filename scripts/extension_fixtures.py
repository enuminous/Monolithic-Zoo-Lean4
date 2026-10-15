#!/usr/bin/env python3
"""Reproduce finite decision-stage certificates from the pinned Python sources.

No network, NumPy, or machine-learning dependency is needed. Nightingale's
four-condition branch is explicitly projected; its statistics are not tested.
"""
import ast
import copy
import hashlib
import itertools
import json
from pathlib import Path
import sys
import types

ROOT = Path(__file__).resolve().parents[1]
SOURCES = json.loads((ROOT / "extension-sources.json").read_text())
out = ["import Extensions", "", "namespace Zoo.ExtensionFixtures", "open Zoo.Extensions", ""]
counts = {}

def load(repo):
    row = next(r for r in SOURCES if r["repository"] == "enuminous/" + repo)
    data = row["content"].encode()
    assert hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest() == row["git_blob_sha1"]
    mod = types.ModuleType("frozen_" + repo.replace("-", "_"))
    sys.modules[mod.__name__] = mod
    exec(compile(row["content"], row["path"], "exec"), mod.__dict__)
    return mod

def bs(xs):
    return ", ".join("true" if x else "false" for x in xs)

def cert(group, expression, expected):
    n = counts.get(group, 0)
    counts[group] = n + 1
    out.append(f"theorem {group}_{n:04d} : {expression} = {expected} := by decide")

gate = {"PASS": ".pass", "FAIL": ".fail", "N/A": ".na"}
chimera = load("Chimera")
for vals in itertools.product([False, True], repeat=7):
    event = chimera.Event("object", "interaction", *vals)
    expected = json.dumps(chimera.classify(event)["tags"])
    cert("chimera", "Chimera.tags ⟨" + bs(vals) + "⟩", expected)

circus = load("Circus")
seen = set()
for missing, na, unknown, feedback, risk, failed, incomplete, present in itertools.product([False, True], repeat=8):
    report = {
        "pipeline": [{"stage": "definition", "provenance_status": "missing" if missing else "documented"}],
        "dependencies": [], "risks": [], "independent_checks": []}
    if unknown: report["dependencies"].append({"materiality": "unknown"})
    if feedback: report["dependencies"].append({"materiality": "material", "feedback": True})
    if na: report["risks"].append({"materiality": "material", "status": "na"})
    if risk: report["risks"].append({"materiality": "material", "status": "present"})
    if present:
        report["independent_checks"].append({"status": "failed" if failed else "passed",
            "frozen": not incomplete, "independently_sourced": True})
    summary = (missing, na, unknown, feedback, risk or na, failed and present,
        (failed or incomplete) and present, present)
    if summary in seen: continue
    seen.add(summary)
    cert("circus", "Circus.decideGate ⟨" + bs(summary) + "⟩", gate[circus.decide(report)])

monster = load("Zoo-Monster")
seen = set()
for vals in itertools.product([False, True], repeat=10):
    prereg, protocol, tolerance, matched, conditions, mandatory, violation, boundary, incomplete, unknown = vals
    cells = []
    if conditions:
        cells = [{"registered": mandatory, "status": "complete", "candidate": -1 if violation else 1, "baseline": 1}]
        if incomplete: cells.append({"registered": mandatory, "status": "pending", "candidate": None, "baseline": None})
    report = {"preregistration": {"registered_before_outcomes": prereg, "protocol_id": "P" if protocol else ""},
        "metric": {"tolerance": 0 if tolerance else None, "direction": "higher_is_better"},
        "baseline": {"matched": matched}, "conditions": cells,
        "failure_boundaries": ([{"status": "failure_observed"}] if boundary else []) +
            ([{"status": "unknown"}] if unknown else [])}
    summary = (prereg, protocol, tolerance, matched, conditions, conditions and mandatory,
        conditions and mandatory and violation, boundary, conditions and mandatory and incomplete, unknown)
    if summary in seen: continue
    seen.add(summary)
    cert("monster", "Monster.decideGate ⟨" + bs(summary) + "⟩", gate[monster.decide(report)])

woodpecker = load("woodpecker")
seen = set()
for baseline, ablated, epsilon, fraction, higher in itertools.product([0., 10.], [-10., 0., 4., 5., 9., 10.], [0., 1.], [0., .5, 1.], [False, True]):
    case = {"claim": "frozen", "component": "c", "baseline_value": baseline,
        "ablated_value": ablated, "metric": "m", "higher_is_better": higher,
        "epsilon": epsilon, "contributory_fraction": fraction, "ablation": "a",
        "preserved_conditions": [], "violations": [], "pre_registered": True,
        "proxy_leakage": False, "claim_type": "necessity"}
    result = woodpecker.evaluate(case)
    loss = result.loss
    threshold = max(epsilon, abs(result.oriented_baseline) * (1. - fraction))
    summary = (True, loss <= epsilon, loss > threshold)
    if summary in seen: continue
    seen.add(summary)
    cert("woodpecker", "Woodpecker.classify " + " ".join(bs([v]) for v in [True, loss <= epsilon, loss > threshold]),
         "." + result.disposition.value.lower())

# Extract the exact stop-reason assignments and branch order, while treating
# numerical/statistical predicates as four independent inputs. This explicitly
# does not execute or certify the ALE/bootstrap calculations.
row = next(r for r in SOURCES if r["repository"].endswith("/Nightengale"))
data = row["content"].encode()
assert hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest() == row["git_blob_sha1"]
tree = ast.parse(row["content"])
grow = next(n for n in ast.walk(tree) if isinstance(n, ast.FunctionDef) and n.name == "_grow")
branch = next(n for n in ast.walk(grow) if isinstance(n, ast.If) and
    isinstance(n.test, ast.Call) and ast.unparse(n.test).startswith("np.any(counts"))
branch = copy.deepcopy(branch)
node = branch
for name in ["smallSupport", "smallEffect", "unstable", "depthReached"]:
    node.test = ast.Name(id=name, ctx=ast.Load())
    assert len(node.body) == 1 and isinstance(node.body[0], ast.Assign)
    if name != "depthReached":
        assert len(node.orelse) == 1 and isinstance(node.orelse[0], ast.If)
        node = node.orelse[0]
    else:
        assert not node.orelse
fn = ast.parse("def projected(smallSupport, smallEffect, unstable, depthReached):\n reason = None\n return reason\n")
fn.body[0].body.insert(1, branch)
ast.fix_missing_locations(fn)
scope = {}
exec(compile(fn, "<Nightingale stop projection>", "exec"), scope)
labels = {None: "continueGrowing", "insufficient_local_support": "insufficientSupport",
          "effect_below_tolerance": "belowTolerance", "bootstrap_instability": "instability", "max_depth": "maxDepth"}
for vals in itertools.product([False, True], repeat=4):
    cert("nightingale", "Nightingale.stop " + " ".join(bs([v]) for v in vals), "." + labels[scope["projected"](*vals)])

out += ["", "end Zoo.ExtensionFixtures", ""]
text = "\n".join(out)
target = ROOT / "ExtensionFixtures.lean"
if "--write" in sys.argv:
    target.write_text(text)
else:
    assert target.read_text() == text, "Extension fixtures drifted; inspect the source change before regeneration"
print("Source-derived finite decision certificates:", counts, "total", sum(counts.values()))
