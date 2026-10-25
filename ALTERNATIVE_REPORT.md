# Alternative Zoo limiter report

This is the alternative evidence-coverage report requested on 25 October 2026.
It does **not replace the main Zoo report**, modify an animal's operation, or
claim that the 46 kernels have run on a supplied claim. It aggregates explicitly
supplied operation results and keeps missing results visible.

```bash
python3 scripts/alternative_report.py limiter-input.example.json
python3 scripts/test_alternative_report.py
```

The executable emits `status` for every one of the frozen 46 animal rows:
`PASS`, `FAIL`, `UNRESOLVED`, or `N/A`. It also emits counts, exact fractions,
mandatory-obligation outcomes, local and propagated status, reasons, dependency
blockers and affected descendants. The input and policy hashes travel with the
report. [The checked-in output](limiter-output.example.json) is a real invocation
on the deliberately incomplete ME-007 intake: 46 UNRESOLVED outcomes and a
QUALIFIED claim. It is not a completed 46-animal audit of ME-007.

## Frozen arithmetic and decision rules

`P + F + U + I = 46`; `d = (P + F)/46`, `u = U/46`, `i = I/46`.
N/A stays in the denominator. Missing evidence never becomes N/A.
Every local ESTABLISHED label requires all of:

- zero FAIL results;
- `d >= 4/5` and `u <= 1/10`;
- an explicitly complete inventory of mandatory obligations;
- PASS with an evidence reference for each mandatory obligation.

The numeric thresholds are **new engineering defaults**, recorded in
[limiter-policy.json](limiter-policy.json) before running the implementation's
fixtures. They were not found in the previously accepted policy and are not
retroactive preregistration of an experiment. The 80% floor prevents sparse
coverage from appearing complete; the 10% ceiling limits unresolved optional
checks while the mandatory gate blocks every essential unresolved step.
Change thresholds only under a new policy ID and retain old reports.

A FAIL remains a veto even when every check is determined. A dependent claim
can be ESTABLISHED only if it and every required ancestor qualify locally.
Missing dependencies and required cycles block the claim and all descendants.
A cyclic argument must be replaced by separately reviewed noncircular evidence;
this implementation does not guess that a cycle is harmless.

`ESTABLISHED` is a **policy coverage label**, not certification of mathematical
truth, empirical validity, or independent replication. Evidence references and
the completeness of the supplied dependency/obligation inventory still require
human or independently validated audit. No aggregator can discover omitted
premises from labels alone.

## Input contract

Each claim needs a unique `id`, a frozen `target` reference, an explicit Boolean
`obligation_inventory_complete`, and optional `dependencies`,
`mandatory_obligations`, `obligations`, and `results`.
`results` is keyed by the uppercase names from `Registry.lean`; unknown names or
statuses are rejected. Missing animal rows are filled with UNRESOLVED.

For PASS/FAIL, supply `basis: "observed"` and nonempty `evidence` references.
For N/A, supply `basis: "inapplicable"`, a substantive `reason` and applicability
evidence. `basis: "missing_evidence"` always normalizes to UNRESOLVED, including
an attempted N/A. Undocumented determinations/inapplicability also normalize to
UNRESOLVED. The submitted status is retained as `declared_status` for audit.
An undocumented declared FAIL also blocks establishment until adjudicated; it
cannot be laundered into an allowable optional evidence gap.
Mandatory obligations accept the same result structure, but only PASS satisfies
them. Empty required-obligation lists are allowed only with an explicit inventory
completeness declaration; that declaration is a reviewable input assertion.

## Validation

The regression suite checks all-FAIL inputs, fixed denominators, mislabeled and
documented N/A, exact threshold boundaries, missing mandatory evidence,
qualified-premise chains, missing dependencies, cycles and their descendants,
unsupported PASS labels, invalid input, and both resolution monotonicity rules.
Fixture PASS evidence is marked `fixture://test-only`; it is not scientific evidence.
