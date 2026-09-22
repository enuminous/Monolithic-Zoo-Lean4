import Core

namespace Zoo.Beaver


structure Input where
  effectiveness : Float
  collateral : Float
  verification : Float
  bounded : Bool
  rollbackVerified : Bool
  minEffectiveness : Float := 0.05
  maxCollateral : Float := 0.2
  minVerification : Float := 1.0
  deriving Repr
/-- Source beaver.py acceptance. A snapshot copy is not a real-world rollback proof. -/
def Accepted (x : Input) : Prop :=
  x.effectiveness ≥ x.minEffectiveness ∧ x.collateral ≤ x.maxCollateral ∧
  x.verification ≥ x.minVerification ∧ x.bounded = true ∧ x.rollbackVerified = true
theorem accepted_requires_rollback (x : Input) (h : Accepted x) :
    x.rollbackVerified = true := h.2.2.2.2
theorem accepted_requires_bounds (x : Input) (h : Accepted x) :
    x.bounded = true := h.2.2.2.1


end Zoo.Beaver
