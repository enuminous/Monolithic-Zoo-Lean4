# Verification status — October 15, 2026 (Pacific)

Verified proof commit: [`0d616cd62cc9f061ff02b239eb2c7b3eb14a391d`](https://github.com/enuminous/Monolithic-Zoo-Lean4/commit/0d616cd62cc9f061ff02b239eb2c7b3eb14a391d).
Successful run: [38831479150](https://github.com/enuminous/Monolithic-Zoo-Lean4/actions/runs/38831479150).
Every verification step completed successfully using the standard pinned Lean
4.19.0 toolchain in GitHub Actions. No workflow or dependency pins changed.

## CIRCUS proof repair

`Zoo.SourceRecords.Circus.pass_checks_complete` now converts the negated Boolean
proposition returned by `List.any_eq_false` using `Bool.of_not_eq_true`, then
explicitly assembles the required conjunction from the simplified fields.
Only the proof body and its manifest checksum changed in the verified commit.
The theorem's assumptions and conclusion, report definitions, decision rules,
and frozen Python sources are unchanged. No new assumptions were introduced.

Together with `pass_has_checks`, the theorem establishes that a passing modeled
report has a nonempty check list whose records are passed, frozen and marked
independently sourced. It checks the supplied record fields; it does not
authenticate the observations or establish real-world independence.

## Passed verification

| Check | Result |
|---|---|
| Pinned Lean library build | Passed, including `SourceRecords` and `ExactThresholds` |
| Strict project axiom audit | Passed; only `propext`, `Classical.choice`, and `Quot.sound` allowed |
| Audit rejection controls | All four rejected the intended public/private axioms, placeholder and native proof |
| Frozen-source decision certificates | 643 reproduced and included in the checked library |
| Structured-report correspondence | 1,432 Python-derived equalities kernel-checked and axiom-audited: 128 CHIMERA, 256 CIRCUS, 1,048 MONSTER |
| Exact-threshold correspondence | 2,100 Python-derived equalities kernel-checked and axiom-audited; included binary64 intermediates also compared with exact fractions |
| Static provenance and integrity | Passed: 186 original source hashes, fixture consistency and manifest checks |
| Finite reference regressions | All 90 passed |
| Module roster | All 46 listed |
| Toolchain and dependency pins | Unchanged |

## Evidence boundaries

**Demonstrated:** the stated Lean theorems for the explicit mathematical models,
and agreement on the finite source-executed certificate and regression inputs.
These are distinct kinds of evidence; the finite comparisons do not prove
universal Python/Lean implementation equivalence.

**Supported but incomplete:** end-to-end Zoo implementation equivalence.
Seventeen modules aggregate ranks over supplied columns; upstream feature
extraction, model fitting and whole-pipeline equivalence remain unported.
JSON decoding, permissive Python coercions and general floating-point behavior
remain outside the structured-report contracts. Neither theorem checking nor
finite correspondence establishes empirical effectiveness or EFMW physics.
See [SOURCE_RECORD_COVERAGE.md](SOURCE_RECORD_COVERAGE.md),
[COVERAGE.md](COVERAGE.md), and [FORMALIZATION_NOTES.md](FORMALIZATION_NOTES.md).

The earlier selected-kernel verification remains recorded at commit
[`6300fa3`](https://github.com/enuminous/Monolithic-Zoo-Lean4/commit/6300fa3b59f357b258e09c7816ad0c15fb1a7935)
and run [38482154688](https://github.com/enuminous/Monolithic-Zoo-Lean4/actions/runs/38482154688).
The successful run above additionally verifies the structured reports and exact
threshold arithmetic that were blocked by the CIRCUS elaboration errors.
