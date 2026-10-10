# Monolithic Zoo — 46 animals in Lean 4

<!-- ENUMINOUS-NETWORK:START -->
**eNuminous network:** [All repositories](https://enuminous.github.io/EFMW/repositories.html) · [EFMW](https://enuminous.github.io/EFMW/) · [102 equations](https://github.com/enuminous/Monolithic_102_EFMW) · [165 triplets](https://enuminous.github.io/FieldSpace/) · [Zoo](https://enuminous.github.io/Tortoise/) · [Lean](https://enuminous.github.io/Aristotle-102-Monolithic-Lean/) · [Engine](https://enuminous.github.io/Archimedes-Engine/) · [Papers](https://enuminous.github.io/medium/papers-essays-index.html) · [Audit](https://github.com/enuminous/EFMW_Post156_Zoo_Audit/blob/main/portfolio/INTERLOCK_AUDIT.md)

[Repository](https://github.com/enuminous/Monolithic-Zoo-Lean4) · This repository is linked through its source; GitHub Pages is not enabled.
<!-- ENUMINOUS-NETWORK:END -->

A strictly flat, GitHub-ready source repository for the original main sequence, TORTOISE through BUTTERFLY. Each animal has its own root-level `.lean` file. All source, configuration, documentation and reference data files are at the repository root; the ZIP has no enclosing folder.

**Status: uncompiled formalization draft.** All 46 animals are represented by selected operational kernels and contracts. This is not a complete translation of all upstream Python pipelines. Seventeen modules implement rank aggregation over supplied feature columns; feature extraction and model training remain unported. See [COVERAGE.md](COVERAGE.md) and [BUILD_STATUS.md](BUILD_STATUS.md).

## Build and check

Install Lean through elan, then run these commands from the extracted repository root. `lean-toolchain` pins Lean 4 v4.19.0. No Mathlib dependency is required.

```sh
python3 verify.py
lake build
lake build zoo46 regression
lake exe zoo46
lake exe regression
lake env lean ProofAudit.lean
```

The reference runner contains 90 comparisons generated from selected pinned upstream Python kernels and pandas rank operations in the preceding draft. They have not been executed against Lean. `ProofAudit.lean` requests theorem dependency reports; inspect output for `sorryAx` and unexpected axioms. Normal Lean foundational axioms must be distinguished from invented assumptions.

## Contents

- 46 animal modules; `Core.lean` supplies shared definitions.
- `Registry.lean` enumerates exactly 46 unique animals; `Zoo.lean` imports them.
- `Main.lean` prints the roster; `Regression.lean` checks reference values.
- `coverage.json` records each upstream repository, pinned revision, scope and theorem names.
- `UPSTREAM_SOURCES.json` embeds selected original source files and license notices with their original paths and Git blob hashes. These paths are metadata, not repository directories.
- `verify.py` checks static consistency and integrity. It does not run Lean.

The source tree is flat. Lake and Git create their own local working directories when used. An active GitHub Actions workflow would require a nested `.github/workflows` directory, so it is not included in this strictly flat version.

## GitHub

Extract the ZIP into an empty directory and upload its files to a new GitHub repository, or initialize Git there and push to your chosen remote. This archive has not been published to GitHub.

## Interpretation

Contracts express explicit assumptions; they do not establish that real systems satisfy those assumptions. Formal verification can validate specified software properties. It cannot establish EFMW as new physics. Numerical equivalence and empirical claims require separate evidence. See [FORMALIZATION_NOTES.md](FORMALIZATION_NOTES.md).
