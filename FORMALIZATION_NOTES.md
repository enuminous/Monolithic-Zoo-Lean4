# Formalization choices and unresolved obligations

## Roster

The September 20, 2026 main-sequence guide explicitly ends at BUTTERFLY (#46). It distinguishes TORTOISE (experiment control) from TURTLE (synthesis) and fixes OWL to Observational Warning Layer. The older workbench's mixed roster is not substituted for that guide.

## Contracts versus claims

Caller-provided predicates and flags are inputs, not global axioms. Examples: CROCODILE's identification design, RHINO's domain invariants, and the shared AuditContext. A proof that accepted BEAVER repairs require a rollback flag does not demonstrate that a physical rollback occurred.

## Known upstream limitations retained

- Several feature pipelines rank across all supplied rows before splitting or evaluating. An output can depend on future data. The formalization keeps the dataset visible and does not certify this as an online estimator.
- BAT chooses its best baseline from evaluated scores; a verdict-kernel port does not fix selection bias or establish a prespecified baseline procedure.
- ELEPHANT's original retention fraction divides retained importance by itself; it is not an external memory-retention test. That fraction is not elevated to a proved reliability property here. Lean lineage uses explicit fuel and returns a list prefix, whereas Python stops on repeated IDs: these are different traversal guards and the module is not marked a full behavioral equivalence.
- BEAVER's original rollback check compares a copied snapshot with the original. It is not proof of undoing an actual external side effect.
- BISON computes retry generation but does not inject it into later demand in the saved implementation. No added feedback loop is claimed.
- SALMON's source uses an operational visit cap; its Lean trace uses explicit fuel with an `exhausted` constructor. The traversal is a total contract abstraction, not a port of weighted contribution accounting or identical exception behavior.
- PHOENIX permits a zero-length hold window; the selected rule preserves that behavior rather than inventing a minimum. A production wrapper should validate configuration separately.
- Float kernels require the stated finite-input conventions. Negative zero, NaN ordering, and reduction-order roundoff can differ from Python/NumPy. They require additional equivalence analysis.

## Priorities after the build gate

1. Correct any elaboration errors and preserve real compiler logs.
2. Execute reference fixtures and expand them around numerical edge cases.
3. Translate source feature extraction for the seventeen rank-aggregation modules.
4. Specify and prove the connection between feature extraction, model fitting, and held-out scoring; external ML fitting cannot be assumed verified merely by assigning it a function type.
5. Formalize error bounds for numeric bridges and separate online from retrospective rank semantics.
6. Add new lemmas driven by real failure modes rather than optimizing the theorem count.

These steps do not substitute for empirical validation of the Zoo or EFMW physics.
