#!/usr/bin/env python3
"""Alternative evidence-coverage report. Does not execute or replace Zoo kernels."""
import argparse
from collections import Counter
from fractions import Fraction
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
STATUSES = {"PASS", "FAIL", "UNRESOLVED", "N/A"}


def load_policy(path=ROOT / "limiter-policy.json"):
    raw = Path(path).read_bytes()
    policy = json.loads(raw)
    names = [r["module"].upper() for r in json.loads((ROOT / "coverage.json").read_text())]
    if policy["animals"] != names or len(set(names)) != 46:
        raise ValueError("Policy must match the fixed 46-animal roster in order")
    for name in ("tau_d", "tau_u"):
        value = policy[name]
        if any(type(value[k]) is not int for k in ("numerator", "denominator")):
            raise ValueError("Thresholds require integer fractions")
        q = Fraction(value["numerator"], value["denominator"])
        if not 0 <= q <= 1:
            raise ValueError("Threshold out of range")
    return policy, hashlib.sha256(raw).hexdigest()


def normalized(record):
    """Retain declared status, while absent/insufficient evidence remains unresolved."""
    if record is None:
        return {"status": "UNRESOLVED", "declared_status": None,
                "reason": "MISSING_RESULT", "evidence": []}
    status = record.get("status")
    if status not in STATUSES:
        raise ValueError(f"Unknown status: {status!r}")
    evidence = record.get("evidence", [])
    if not isinstance(evidence, list) or any(not isinstance(e, str) or not e.strip() for e in evidence):
        raise ValueError("Evidence must be a list of nonempty references")
    reason = record.get("reason", "")
    if not isinstance(reason, str):
        raise ValueError("Reason must be text")
    basis = record.get("basis")
    if basis not in {"observed", "missing_evidence", "inapplicable", None}:
        raise ValueError("Unknown evidence basis")
    actual, code = status, reason
    if basis == "missing_evidence":
        actual, code = "UNRESOLVED", "MISSING_EVIDENCE"
    elif status in {"PASS", "FAIL"} and (basis != "observed" or not evidence):
        actual, code = "UNRESOLVED", "UNDOCUMENTED_DETERMINATION"
    elif status == "N/A" and (basis != "inapplicable" or not evidence or not reason.strip()):
        actual, code = "UNRESOLVED", "UNDOCUMENTED_INAPPLICABILITY"
    return {"status": actual, "declared_status": status, "reason": code,
            "declared_reason": reason, "basis": basis, "evidence": evidence}


def string_list(values, name):
    if not isinstance(values, list) or any(not isinstance(v, str) or not v for v in values):
        raise ValueError(f"{name} must be a list of identifiers")
    if len(set(values)) != len(values):
        raise ValueError(f"Duplicate {name}")
    return values


def report(data, policy, policy_sha256):
    claims = data.get("claims")
    if not isinstance(claims, list) or not claims:
        raise ValueError("A nonempty claims list is required")
    ids = [c.get("id") for c in claims]
    string_list(ids, "claim IDs")
    animals = policy["animals"]
    thresholds = {k: Fraction(policy[k]["numerator"], policy[k]["denominator"])
                  for k in ("tau_d", "tau_u")}
    rows, dependencies = {}, {}
    for claim in claims:
        cid = claim["id"]
        if not isinstance(claim.get("target"), str) or not claim["target"].strip():
            raise ValueError(f"{cid}: a frozen target reference is required")
        deps = string_list(claim.get("dependencies", []), "dependencies")
        dependencies[cid] = deps
        submitted = claim.get("results", {})
        if not isinstance(submitted, dict) or set(submitted) - set(animals):
            raise ValueError(f"{cid}: unknown animal or malformed results")
        results = [{"animal": name, **normalized(submitted.get(name))} for name in animals]
        counts = dict.fromkeys(["PASS", "FAIL", "UNRESOLVED", "N/A"], 0)
        counts.update(Counter(r["status"] for r in results))
        p, f, u, na = (counts[k] for k in ["PASS", "FAIL", "UNRESOLVED", "N/A"])
        assert p + f + u + na == 46
        d = Fraction(p + f, 46)
        unresolved = Fraction(u, 46)
        required = string_list(claim.get("mandatory_obligations", []), "mandatory obligations")
        obligations = claim.get("obligations", {})
        if not isinstance(obligations, dict) or set(obligations) - set(required):
            raise ValueError("Obligation results must refer to declared mandatory obligations")
        obligation_results = {name: normalized(obligations.get(name)) for name in required}
        blocked_obligations = [name for name, r in obligation_results.items() if r["status"] != "PASS"]
        reasons = []
        if f:
            reasons.append("FAILURE_VETO")
        if any(r["declared_status"] == "FAIL" and r["status"] != "FAIL" for r in results):
            reasons.append("UNDOCUMENTED_FAILURE_REQUIRES_ADJUDICATION")
        if d < thresholds["tau_d"]:
            reasons.append("DETERMINED_BELOW_THRESHOLD")
        if unresolved > thresholds["tau_u"]:
            reasons.append("UNRESOLVED_ABOVE_THRESHOLD")
        if blocked_obligations:
            reasons.append("MANDATORY_OBLIGATION_NOT_PASSED")
        # Missing labels are evidence gaps, never an opportunity to shrink the denominator.
        complete = claim.get("obligation_inventory_complete")
        if type(complete) is not bool:
            raise ValueError("obligation_inventory_complete must be explicitly true or false")
        if not complete:
            reasons.append("OBLIGATION_INVENTORY_INCOMPLETE")
        rows[cid] = {"id": cid, "target": claim["target"], "counts": counts,
                     "fractions": {"d": {"numerator": p + f, "denominator": 46},
                                   "u": {"numerator": u, "denominator": 46},
                                   "i": {"numerator": na, "denominator": 46}},
                     "results": results, "mandatory_obligations": required,
                     "obligations": obligation_results, "blocked_obligations": blocked_obligations,
                     "local_status": "QUALIFIED" if reasons else "ESTABLISHED",
                     "local_reasons": reasons, "dependencies": deps}
    # Explicit transitive closure: required cycles cannot support themselves.
    ancestors = {}
    for cid in ids:
        seen, pending = set(), list(dependencies[cid])
        while pending:
            parent = pending.pop()
            if parent in seen:
                continue
            seen.add(parent)
            pending.extend(dependencies.get(parent, []))
        ancestors[cid] = seen
    cyclic = {cid for cid in ids if cid in ancestors[cid]}
    for cid, row in rows.items():
        missing = sorted(ancestors[cid] - rows.keys())
        qualified = sorted(a for a in ancestors[cid] if a in rows and rows[a]["local_status"] == "QUALIFIED")
        cycles = sorted(({cid} | ancestors[cid]) & cyclic)
        reasons = list(row["local_reasons"])
        if missing:
            reasons.append("MISSING_DEPENDENCY")
        if qualified:
            reasons.append("QUALIFIED_PREMISE")
        if cycles:
            reasons.append("UNSUPPORTED_REQUIRED_CYCLE")
        row.update(propagated_status="QUALIFIED" if reasons else "ESTABLISHED",
                   reasons=reasons, blockers={"missing_dependencies": missing,
                   "qualified_ancestors": qualified, "cycle_members": cycles},
                   affected_descendants=sorted(other for other in ids if cid in ancestors[other] and other != cid))
    return {"schema_version": 1, "report_kind": "alternative_zoo_limiter",
            "policy_id": policy["policy_id"], "policy_sha256": policy_sha256,
            "input_sha256": hashlib.sha256(json.dumps(data, sort_keys=True, separators=(",", ":")).encode()).hexdigest(),
            "semantics": "ESTABLISHED means this evidence-coverage policy is satisfied; it does not certify truth, physics or independent replication. Supplied evidence references are not independently verified by this aggregator.",
            "claims": [rows[cid] for cid in ids]}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path)
    parser.add_argument("--policy", type=Path, default=ROOT / "limiter-policy.json")
    args = parser.parse_args()
    try:
        policy, digest = load_policy(args.policy)
        output = report(json.loads(args.input.read_text()), policy, digest)
    except (ValueError, KeyError, TypeError, ZeroDivisionError) as exc:
        parser.error(str(exc))
    print(json.dumps(output, indent=2, ensure_ascii=False))


if __name__ == "__main__":
    main()
