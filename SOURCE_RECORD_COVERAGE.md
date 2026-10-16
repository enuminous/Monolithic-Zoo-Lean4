# Structured extension coverage

The target is the unchanged, commit-pinned Python in `extension-sources.json`.
`SourceRecords.lean` extends the earlier decision summaries with actual
records and arbitrary finite lists.

| Source | New checked scope | Excluded inputs or behavior |
|---|---|---|
| CHIMERA `classify` | Every return field, all seven Boolean inputs, arbitrary object/interaction strings; sequential source model equals the factored classifier universally. | Incorrectly typed dataclass arguments, JSON decoding and command-line I/O. |
| CIRCUS `decide` | Pipeline, dependency, risk and check lists; optional string fields and Boolean fields with source defaults; summary extraction and gate. Passing reports contain checks and every check is passed, frozen and independently sourced. Material N/A risks cause FAIL even with missing checks. | Non-Boolean truthy objects, malformed records, JSON decoding and command-line I/O. |
| MONSTER `decide` | Registered-condition filtering, source eligibility, violation and missing-data precedence, boundaries, exact integer threshold comparisons including intervals. A registered violation cannot be hidden by another missing cell in an eligible report. | Floating-point measurements, permissive Python coercions, the separate `envelope` helper, JSON decoding and command-line I/O. |

The Chimera theorem compares two explicit Lean models of the pinned algorithm.
Its source correspondence is additionally checked by executing Python, rather
than assuming an unproved theorem about the Python interpreter.

`scripts/report_fixtures.py` executes the pinned Python on 128 full Chimera
records, 256 Circus reports and 1,048 Monster reports. It writes 1,432 concrete
Lean equalities covering the full modeled outputs. CI checks each equality
with ordinary kernel reduction and runs the strict axiom audit over those
declarations. There is no native-reduction trust exception.

These certificates test more than the earlier Boolean projection: the input
lists and records are provided directly to Lean, so an incorrect list filter,
field default or summary extraction can fail the comparison. They remain
finite regression evidence, supplemented by the universal theorems above.
They are not a proof of the Python VM, arbitrary JSON input, IEEE arithmetic,
scientific truth of supplied observations, or the remaining 46-animal feature,
fitting and evaluation pipelines.

The stated Lean theorems and finite certificates are **demonstrated** for
commit [`0d616cd`](https://github.com/enuminous/Monolithic-Zoo-Lean4/commit/0d616cd62cc9f061ff02b239eb2c7b3eb14a391d),
whose complete [verification run 38831479150](https://github.com/enuminous/Monolithic-Zoo-Lean4/actions/runs/38831479150)
passed. That commit repairs only the proof of CIRCUS check completeness and its
manifest checksum; the report semantics and frozen sources are unchanged.
The theorem checks the reported fields, not the authenticity or real-world
independence of the supplied evidence. See [BUILD_STATUS.md](BUILD_STATUS.md).
Full implementation equivalence across all Zoo repositories remains
**supported but incomplete**, with the remaining boundaries in
`FORMALIZATION_NOTES.md` and `EXTENSION_COVERAGE.md`.
