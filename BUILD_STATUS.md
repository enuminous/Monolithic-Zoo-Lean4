# Verification status — October 13, 2026

Verified proof commit: [`6300fa3b59f357b258e09c7816ad0c15fb1a7935`](https://github.com/enuminous/Monolithic-Zoo-Lean4/commit/6300fa3b59f357b258e09c7816ad0c15fb1a7935).
Successful run: [38482154688](https://github.com/enuminous/Monolithic-Zoo-Lean4/actions/runs/38482154688).

Passed: pinned Lean 4.19 library build, strict axiom audit, four audit rejection
controls, all 90 finite reference comparisons, and the 46-animal roster.
The allowed axioms are only `propext`, `Classical.choice`, and `Quot.sound`.

The Falcon executable decision now unfolds its missed-hazard comparison directly;
its mathematical predicate and theorems are unchanged. No new mathematical
assumptions were introduced.

The package covers selected operational kernels and contracts. Seventeen modules
perform rank aggregation over supplied columns; upstream feature extraction,
model training and whole-pipeline equivalence remain unported. See COVERAGE.md.
A successful finite regression does not prove full Python/Lean equivalence or
empirical effectiveness. Historical claims that this package was uncompiled
are superseded by the exact-commit evidence above.
