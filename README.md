# Monolithic Zoo — 46 animals in Lean 4

<!-- ENUMINOUS-UNIFIED-NAV:START -->
## Repository navigation

**eNuminous network:** [All public repositories](https://github.com/enuminous/EFMW/blob/main/REPOSITORY_NAVIGATION.md) · [EFMW](https://github.com/enuminous/EFMW) · [102 equations](https://github.com/enuminous/Monolithic_102_EFMW) · [Frozen Lean](https://github.com/enuminous/Monolithic-102-Zoo-Lean4) · [Zoo](https://github.com/enuminous/Tortoise) · [Papers](https://github.com/enuminous/papers) · [Quantum geometry](https://github.com/enuminous/Base888-Quantum-Geometry)

**This project:** [Repository home](https://github.com/enuminous/Monolithic-Zoo-Lean4) · [Subject index](https://github.com/enuminous/EFMW/blob/main/REPOSITORY_NAVIGATION.md#lean-proofs-and-independent-audits)

<details open>
<summary><strong>On this page</strong></summary>

- [Build and check](#build-and-check)
- [Contents](#contents)
- [Reproducibility](#reproducibility)
- [Interpretation](#interpretation)
- [Extension decision coverage](#extension-decision-coverage)


</details>

**Related repositories:** [Tortoise](https://github.com/enuminous/Tortoise) · [Monolithic-102-Zoo-Lean4](https://github.com/enuminous/Monolithic-102-Zoo-Lean4) · [EFMW_Post156_Zoo_Audit](https://github.com/enuminous/EFMW_Post156_Zoo_Audit) · [papers](https://github.com/enuminous/papers) · [Monlithic_EFMW_102_Lean4](https://github.com/enuminous/Monlithic_EFMW_102_Lean4) · [Aristotle-102-Monolithic-Lean](https://github.com/enuminous/Aristotle-102-Monolithic-Lean) · [Nightengale-Full-Zoo-Audit](https://github.com/enuminous/Nightengale-Full-Zoo-Audit) · [Monolithic_102_EFMW](https://github.com/enuminous/Monolithic_102_EFMW) · [EFMW](https://github.com/enuminous/EFMW)

> **Evidence boundary:** A link between projects is navigation, not an assertion of proven equivalence, experimental validation, or shared authorship. See each repository’s own status and review notes.
<!-- ENUMINOUS-UNIFIED-NAV:END -->


**Alternative coverage report:** [four-state limiter](ALTERNATIVE_REPORT.md) · [policy](limiter-policy.json) · [executable example output](limiter-output.example.json). This is separate from the main Zoo report.

A shared Lean 4 package for the original main sequence, TORTOISE through BUTTERFLY, and separately tracked extension models. Each original animal has a root-level `.lean` file. The pinned Python source snapshots make the verification scope reproducible.

**Status: compiled and audited selected formalization.** All 46 animals are represented by selected operational kernels and contracts. This is not a complete translation of all upstream Python pipelines. Seventeen modules implement rank aggregation over supplied feature columns; feature extraction and model training remain unported. See [COVERAGE.md](COVERAGE.md) and [BUILD_STATUS.md](BUILD_STATUS.md).

## Build and check

Install Lean through elan, then run these commands from the extracted repository root. `lean-toolchain` pins Lean 4 v4.19.0. No Mathlib dependency is required.

```sh
python3 verify.py
lake build
lake build zoo46 regression
lake exe zoo46
lake exe regression
lake env lean -DwarningAsError=true Audit.lean
python3 scripts/test_axiom_audit.py
python3 scripts/extension_fixtures.py
python3 scripts/report_fixtures.py
lake env lean -DwarningAsError=true .lake/SourceReportFixtures.lean
```

The reference runner contains 90 comparisons generated from selected pinned upstream Python kernels and pandas rank operations in the preceding draft. All 90 comparisons passed in the [verified run](https://github.com/enuminous/Monolithic-Zoo-Lean4/actions/runs/38482154688). `Audit.lean` enforces the strict project axiom allowlist, and rejection controls test public/private axioms, `sorryAx` and native proof evaluation. `ProofAudit.lean` remains available for human-readable dependency reports. Normal Lean foundational axioms must be distinguished from invented assumptions.

## Contents

- 46 animal modules; `Core.lean` supplies shared definitions.
- `Registry.lean` enumerates exactly 46 unique animals; `Zoo.lean` imports them.
- `Main.lean` prints the roster; `Regression.lean` checks reference values.
- `coverage.json` records each upstream repository, pinned revision, scope and theorem names.
- `UPSTREAM_SOURCES.json` embeds selected original source files and license notices with their original paths and Git blob hashes. These paths are metadata, not repository directories.
- `verify.py` checks static consistency and integrity. It does not run Lean.

The active [verification workflow](.github/workflows/lean.yml) builds the pinned package, audits declarations and rejection controls, reproduces source certificates, and runs the finite numerical regressions.

## Reproducibility

Clone this repository and use its pinned toolchain. A successful [Actions run](https://github.com/enuminous/Monolithic-Zoo-Lean4/actions) identifies the exact tested commit; the build is evidence only for the stated coverage.

## Interpretation

Contracts express explicit assumptions; they do not establish that real systems satisfy those assumptions. Formal verification can validate specified software properties. It cannot establish EFMW as new physics. Numerical equivalence and empirical claims require separate evidence. See [FORMALIZATION_NOTES.md](FORMALIZATION_NOTES.md).

## Extension decision coverage

[Five extension decision procedures](EXTENSION_COVERAGE.md) now have Lean models, source-pinned finite certificates, and the same CI axiom audit. [Structured report models](SOURCE_RECORD_COVERAGE.md) additionally cover full Chimera returns and Circus/Monster input-list processing, with 1,432 source-executed certificates. Their numerical and data pipelines remain separate obligations. The historical roster remains 46.

[Exact threshold arithmetic](EXACT_ARITHMETIC.md) now covers WOODPECKER's
integer-scaled rational comparisons and 2,100 source certificates. Nightingale's
root stopping rule and recursive depth budget are also checked; its source pin
includes the published fix that preserves row coordinates during recursion.
