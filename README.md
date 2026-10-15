# Monolithic Zoo — 46 animals in Lean 4

<!-- ENUMINOUS-NETWORK:START -->
**eNuminous network:** [All repositories](https://enuminous.github.io/EFMW/repositories.html) · [EFMW](https://enuminous.github.io/EFMW/) · [102 equations](https://github.com/enuminous/Monolithic_102_EFMW) · [165 triplets](https://enuminous.github.io/FieldSpace/) · [Zoo](https://enuminous.github.io/Tortoise/) · [Lean](https://enuminous.github.io/Aristotle-102-Monolithic-Lean/) · [Engine](https://enuminous.github.io/Archimedes-Engine/) · [Papers](https://enuminous.github.io/medium/papers-essays-index.html) · [Audit](https://github.com/enuminous/EFMW_Post156_Zoo_Audit/blob/main/portfolio/INTERLOCK_AUDIT.md)

[Repository](https://github.com/enuminous/Monolithic-Zoo-Lean4) · This repository is linked through its source; GitHub Pages is not enabled.

<details>
<summary>Recent repositories (9)</summary>

- [Oroboros](https://github.com/enuminous/Oroboros) · [README](https://github.com/enuminous/Oroboros/blob/main/README.md) · [Page](https://enuminous.github.io/Oroboros/)
- [P-NP](https://github.com/enuminous/P-NP) · [README](https://github.com/enuminous/P-NP/blob/main/README.md) · [Page](https://enuminous.github.io/P-NP/)
- [Research-Program](https://github.com/enuminous/Research-Program) · [README](https://github.com/enuminous/Research-Program/blob/main/README.md) · [Page](https://enuminous.github.io/Research-Program/)
- [I-Have-Guts](https://github.com/enuminous/I-Have-Guts) · [README](https://github.com/enuminous/I-Have-Guts/blob/main/README.md) · [Page](https://enuminous.github.io/I-Have-Guts/)
- [Wrights-Law](https://github.com/enuminous/Wrights-Law) · [README](https://github.com/enuminous/Wrights-Law/blob/main/README.md) · [Page](https://enuminous.github.io/Wrights-Law/)
- [Aristotle-eNuminous](https://github.com/enuminous/Aristotle-eNuminous) · [README](https://github.com/enuminous/Aristotle-eNuminous/blob/main/README.md) · [Page](https://enuminous.github.io/Aristotle-eNuminous/)
- [Multiverse-Simulator](https://github.com/enuminous/Multiverse-Simulator) · [README](https://github.com/enuminous/Multiverse-Simulator/blob/main/README.md) · [Page](https://enuminous.github.io/Multiverse-Simulator/)
- [accelerando-8192](https://github.com/enuminous/accelerando-8192) · [README](https://github.com/enuminous/accelerando-8192/blob/main/README.md) · [Page source](https://github.com/enuminous/accelerando-8192/blob/main/docs/index.html)
- [Codex-888](https://github.com/enuminous/Codex-888) · [README](https://github.com/enuminous/Codex-888/blob/main/README.md) · [Page](https://enuminous.github.io/Codex-888/)

</details>
<!-- ENUMINOUS-NETWORK:END -->

A strictly flat, GitHub-ready source repository for the original main sequence, TORTOISE through BUTTERFLY. Each animal has its own root-level `.lean` file. All source, configuration, documentation and reference data files are at the repository root; the ZIP has no enclosing folder.

**Status: compiled and audited selected formalization.** All 46 animals are represented by selected operational kernels and contracts. This is not a complete translation of all upstream Python pipelines. Seventeen modules implement rank aggregation over supplied feature columns; feature extraction and model training remain unported. See [COVERAGE.md](COVERAGE.md) and [BUILD_STATUS.md](BUILD_STATUS.md).

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

The reference runner contains 90 comparisons generated from selected pinned upstream Python kernels and pandas rank operations in the preceding draft. All 90 comparisons passed in the [verified run](https://github.com/enuminous/Monolithic-Zoo-Lean4/actions/runs/38482154688). `Audit.lean` enforces the strict project axiom allowlist, and rejection controls test public/private axioms, `sorryAx` and native proof evaluation. `ProofAudit.lean` remains available for human-readable dependency reports. Normal Lean foundational axioms must be distinguished from invented assumptions.

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

## Extension decision coverage

[Five extension decision procedures](EXTENSION_COVERAGE.md) now have Lean models, source-pinned finite certificates, and the same CI axiom audit. Their numerical and data pipelines remain separate obligations. The historical roster remains 46.
