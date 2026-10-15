# WOODPECKER exact threshold model

`ExactThresholds.lean` replaces Boolean comparison inputs with actual integer
arithmetic. Baseline, ablated value and epsilon share a measurement scale.
The contributory fraction is an exact numerator/positive-denominator pair in
[0,1]. The comparison clears that denominator; no integer division or rounding
is used. Both metric directions are supported. Evidence validation is an input
flag and is not itself evidence.

Theorems characterize all four outcomes, prove the redundancy/necessity gap
cannot overlap, and show that negating both measurements while reversing metric
direction preserves the result. In particular, a necessary result requires a
strict threshold crossing; equality remains contributory unless already within
epsilon.

The unchanged pinned Python WOODPECKER source is executed on 2,100 cases,
including invalid fractions/epsilon, reversed directions, equality boundaries,
negative measurements and zero baselines. Each returned numerical intermediate
and the computed threshold agrees exactly with Python Fraction on this grid.
Lean then checks 2,100 classification equalities by ordinary kernel reduction,
and audits each generated proof. This verifies arithmetic on the specified grid;
it does not establish arbitrary binary64, JSON coercion, formatting or Python VM
semantics. Arbitrary exact integer inputs are covered by the Lean theorems.

Nightingale's pin advances to the independently tested row-alignment fix. Its
`fit` root rule now has 16 additional source-derived certificates and a universal
continuation characterization. The recursive depth guard and decreasing depth
budget are proved. The source really emits a depth-one root even when max_depth
is zero; the model preserves that behavior. Statistical estimation, full tree
extraction and floating-point implementation equivalence remain open.
