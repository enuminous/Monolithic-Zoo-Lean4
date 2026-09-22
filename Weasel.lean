import Core

namespace Zoo.Weasel


structure Finding where
  changedKeys : Nat
  severity : Float
  cost : Float
  reproducibility : Float
  deriving Repr
/-- Source bounded search; target execution remains an explicit external function. -/
def admissible (budget : Nat) (f : Finding) : Bool :=
  decide (f.changedKeys ≤ budget ∧ f.severity > 0.0)
def retain (budget : Nat) (findings : List Finding) : List Finding :=
  findings.filter (admissible budget)
theorem retained_within_budget (b : Nat) (fs : List Finding) (f : Finding)
    (h : f ∈ retain b fs) : f.changedKeys ≤ b := by
  have hf := (List.mem_filter.mp h).2
  have hh : f.changedKeys ≤ b ∧ f.severity > 0.0 := of_decide_eq_true hf
  exact hh.1


end Zoo.Weasel
