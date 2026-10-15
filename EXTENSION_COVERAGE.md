# Extension decision procedures

`Extensions.lean` adds five existing extensions without changing the historical
46-animal roster. `extension-sources.json` freezes each upstream commit, Python
file, and Git blob hash. The names and branch order come from those sources.

| Extension | Formalized decision stage | Still outside the proof |
|---|---|---|
| Chimera | Ordered tags, fallback U, nonempty output, K requirements, metadata, notes and warning text. Full returns are compared on all 128 Boolean inputs; the two typed Lean classifier models are universally equivalent. | Truth of declarations, incorrectly typed arguments and JSON parsing. |
| Circus | Typed report lists compute their summaries. FAIL precedence, nonempty checks and completeness of every check are proved; material N/A risks fail. Full report certificates execute the pinned source. | Arbitrary JSON/coercion behavior, provenance truth and actual independence. |
| Zoo-Monster | Typed report filtering, eligibility, violation precedence, missing cells, boundaries and exact integer threshold/interval comparisons. Full report certificates execute the pinned source. | Floating-point comparisons, arbitrary JSON parsing/coercion, envelope statistics and scientific adequacy. |
| Woodpecker | Validation veto and the ordered redundant/necessary/contributory decision. Frozen numeric examples are evaluated by the actual source, then their comparison results are passed to the Lean gate. | Floating-point threshold arithmetic, input conversion, statistical sufficiency and arbitrary-input implementation equivalence. |
| Nightengale / Nightingale | `_grow` stop-condition precedence and continuation exactly when all four tests are false. | Quantiles, ALE, bootstrap, empty-bin interpolation, prediction functions and recursion over data. |

Nightingale's certificate generator extracts the four `if`/`elif` branches and
their literal stop reasons from the frozen Python AST. It treats the four tests
as Boolean inputs. This is explicitly a **branch projection**, not an execution
or verification of its numerical pipeline. The root-level stopping rule in
`fit` is also outside this projection.

The generator executes the pinned Chimera, Circus, Monster and Woodpecker source
files in process. It verifies all source blob hashes, reconstructs the finite
examples, and checks that `ExtensionFixtures.lean` is unchanged. Lean then proves
the generated equalities using ordinary kernel reduction. These fixture
certificates are software conformance checks, not independent scientific
discoveries or a proof of the Python interpreter.

See [structured source coverage](SOURCE_RECORD_COVERAGE.md) for the exact domains of `SourceRecords.lean` and its additional 1,432 certificates.

## Verification

```sh
python3 scripts/extension_fixtures.py
lake build
lake env lean -DwarningAsError=true Audit.lean
python3 scripts/test_axiom_audit.py
python3 scripts/report_fixtures.py
lake env lean -DwarningAsError=true .lake/SourceReportFixtures.lean
python3 verify.py
lake exe regression
```

The existing [workflow](.github/workflows/lean.yml) builds and audits all extension
modules, including every fixture declaration. Its standard-axiom allowlist and
negative controls remain in effect. Exact-commit CI is the publication gate.
Local authoring may use the unmodified Lean 4.28 kernel with an explicit-path
launcher; the required hosted build uses the repository's pinned Lean 4.19.

## Remaining implementation work

This tranche closes the absence of extension **decision-stage** models. It does
not close full implementation equivalence for the Zoo. The original
[formalization notes](FORMALIZATION_NOTES.md) still apply: 17 ranked animals need
their upstream feature extraction connected to the score, fitting/scoring
pipelines need specifications, and NumPy/Lean floating-point behavior needs an
explicit numerical contract. Caller-supplied evidence flags are not evidence
that the conditions happened. No unsupported source behavior was repaired in
this tranche.
