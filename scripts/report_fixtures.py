#!/usr/bin/env python3
"""Execute pinned Python on structured inputs, then kernel-check the complete
Lean outputs. These finite certificates supplement the universal theorems;
they do not certify Python's parser, VM, or floating-point arithmetic."""
import hashlib
import itertools
import json
from pathlib import Path
import sys
import types

ROOT = Path(__file__).resolve().parents[1]
sources = json.loads((ROOT / "extension-sources.json").read_text())
def load(repo):
    row = next(r for r in sources if r["repository"] == "enuminous/" + repo)
    data = row["content"].encode()
    assert hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest() == row["git_blob_sha1"]
    mod = types.ModuleType("reports_" + repo.replace("-", "_"))
    sys.modules[mod.__name__] = mod
    exec(compile(row["content"], row["path"], "exec"), mod.__dict__)
    return mod

def string(x):
    return json.dumps(x, ensure_ascii=False)
def boolean(x):
    assert type(x) is bool
    return str(x).lower()
def option_string(x):
    return "none" if x is None else "(some " + string(x) + ")"
def option_int(x):
    assert x is None or type(x) is int
    return "none" if x is None else "(some (" + str(x) + "))"
def record(xs):
    return "⟨" + ", ".join(xs) + "⟩"
def seq(xs):
    return "[" + ", ".join(xs) + "]"

proofs = []
counts = {}
def cert(group, expression, expected):
    n = counts.get(group, 0)
    counts[group] = n + 1
    proofs.append(f"theorem {group}_{n:04d} : {expression} = {expected} := by decide")

gate = {"PASS": ".pass", "FAIL": ".fail", "N/A": ".na"}
chimera = load("Chimera")
for vals in itertools.product([False, True], repeat=7):
    event = chimera.Event("sample object", "recorded interaction", *vals)
    result = chimera.classify(event)
    inp = record([string(event.object), string(event.interaction), record(list(map(boolean, vals)))])
    output = record([string(result["object"]), string(result["interaction"]),
        seq(list(map(string, result["tags"]))), boolean(result["operational_recovery"]),
        seq(list(map(string, result["notes"]))), string(result["anti_circularity"])])
    cert("chimera", "Zoo.SourceRecords.Chimera.classify " + inp, output)

circus = load("Circus")
def circus_input(r):
    return record([
        seq([record([option_string(p.get("stage")), option_string(p.get("provenance_status"))]) for p in r.get("pipeline", [])]),
        seq([record([option_string(d.get("materiality")), boolean(d.get("feedback", False))]) for d in r.get("dependencies", [])]),
        seq([record([option_string(q.get("materiality")), option_string(q.get("status"))]) for q in r.get("risks", [])]),
        seq([record([option_string(c.get("status")), boolean(c.get("frozen", False)), boolean(c.get("independently_sourced", False))]) for c in r.get("independent_checks", [])])])
for missing, na, unknown, feedback, risk, failed, incomplete, present in itertools.product([False, True], repeat=8):
    report = {"pipeline": [{"stage": "definition", "provenance_status": "missing" if missing else "documented"},
                           {"stage": "unrecognized", "provenance_status": None}],
              "dependencies": [], "risks": [], "independent_checks": []}
    if unknown: report["dependencies"].append({"materiality": "unknown"})
    if feedback: report["dependencies"].append({"materiality": "material", "feedback": True})
    if na: report["risks"].append({"materiality": "material", "status": "na"})
    if risk: report["risks"].append({"materiality": "material", "status": "present"})
    if present:
        report["independent_checks"].append({"status": "failed" if failed else "passed",
            "frozen": not incomplete, "independently_sourced": True})
    cert("circus", "Zoo.SourceRecords.Circus.decideReport " + circus_input(report), gate[circus.decide(report)])

monster = load("Zoo-Monster")
def monster_input(r):
    p, m, b = r.get("preregistration", {}), r.get("metric", {}), r.get("baseline", {})
    t = m.get("tolerance")
    if t is None: tol = "none"
    elif m.get("direction") == "higher_is_better": tol = "(some (.higher (" + str(t) + ")))"
    elif m.get("direction") == "lower_is_better": tol = "(some (.lower (" + str(t) + ")))"
    elif isinstance(t, list) and len(t) == 2: tol = "(some (.interval (" + str(t[0]) + ") (" + str(t[1]) + ")))"
    else: tol = "(some .invalid)"
    return record([boolean(p.get("registered_before_outcomes", False)),
        option_string(p.get("protocol_id")), tol, boolean(b.get("matched", False)),
        seq([record([boolean(c.get("registered", False)), option_string(c.get("status")),
                     option_int(c.get("candidate")), option_int(c.get("baseline"))]) for c in r.get("conditions", [])]),
        seq([option_string(q.get("status")) for q in r.get("failure_boundaries", [])])])
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
    cert("monster", "Zoo.SourceRecords.Monster.decideReport " + monster_input(report), gate[monster.decide(report)])
# Exact integer lower, interval, reversed interval, and malformed-tolerance branches.
for direction, tolerance in [("lower_is_better", 0), ("interval", [-1, 1]), ("interval", [1, -1]), ("unknown", 0)]:
    for value in [None, -2, -1, 0, 1, 2]:
        report = {"preregistration": {"registered_before_outcomes": True, "protocol_id": "P"},
            "metric": {"tolerance": tolerance, "direction": direction},
            "baseline": {"matched": True}, "conditions": [
                {"registered": True, "status": "complete", "candidate": value, "baseline": 0}],
            "failure_boundaries": []}
        cert("monster", "Zoo.SourceRecords.Monster.decideReport " + monster_input(report), gate[monster.decide(report)])
assert counts == {"chimera": 128, "circus": 256, "monster": 1048}
audit = (ROOT / "Audit.lean").read_text()
header, body = audit.split("open Lean in\nrun_cmd do", 1)
target = ROOT / ".lake/SourceReportFixtures.lean"
target.parent.mkdir(exist_ok=True)
target.write_text(header + "\nnamespace AuditProbe.SourceReports\n" +
    "\n".join(proofs) + "\nend AuditProbe.SourceReports\n\nopen Lean in\nrun_cmd do" + body)
print("Generated complete-record Python/Lean certificates:", counts)
print("Run lake env lean -DwarningAsError=true .lake/SourceReportFixtures.lean to check them.")
