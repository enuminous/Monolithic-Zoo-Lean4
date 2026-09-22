import Core

namespace Zoo.Turtle


inductive Verdict where | insufficient | notSupported | supported | conditional | mixed deriving Repr, DecidableEq, BEq
structure Input where
  anyApplicable : Bool
  vetoes : Bool
  groups : Nat
  positiveGroups : Nat
  negativeGroups : Nat
  invariantScore : Float
  minimumGroups : Nat := 3
  supportThreshold : Float := 0.18
  conditionalThreshold : Float := 0.05
  deriving Repr
/-- Source turtle.py: no-applicable gate precedes the veto gate. -/
def run (x : Input) : Verdict :=
  if x.anyApplicable = false then .insufficient
  else if x.vetoes = true then .notSupported
  else if x.groups < x.minimumGroups then .insufficient
  else if x.invariantScore ≥ x.supportThreshold ∧ x.positiveGroups ≥ x.minimumGroups then .supported
  else if x.invariantScore ≥ x.conditionalThreshold ∧ x.positiveGroups > x.negativeGroups then .conditional
  else if x.invariantScore ≤ -x.conditionalThreshold ∨ x.negativeGroups > x.positiveGroups then .notSupported
  else .mixed
theorem applicable_veto_blocks_support (x : Input)
    (a : x.anyApplicable ≠ false) (v : x.vetoes = true) :
    run x = .notSupported := by simp [run, a, v]
theorem empty_is_insufficient (x : Input) (h : x.anyApplicable = false) :
    run x = .insufficient := by simp [run, h]


end Zoo.Turtle
