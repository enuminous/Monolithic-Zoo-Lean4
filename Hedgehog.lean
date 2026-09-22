import Core

namespace Zoo.Hedgehog


inductive Verdict where | generalizes | habitatConditional | weak | doesNotGeneralize deriving Repr, DecidableEq, BEq
structure Input where
  medianGain : Float
  winRate : Float
  materialGain : Float := 0.002
  habitatSupport : Bool
  deriving Repr
/-- Source hedgehog.py summary decision; fitting and habitat correlations are inputs. -/
def run (x : Input) : Verdict :=
  if x.medianGain ≥ x.materialGain ∧ x.winRate ≥ 0.60 then .generalizes
  else if x.medianGain > 0.0 ∧ x.habitatSupport = true then .habitatConditional
  else if x.medianGain > 0.0 then .weak else .doesNotGeneralize
/-- A separate audit obligation: upstream lists must actually be disjoint. -/
def DisjointEnvironments (development heldout : List Nat) : Prop :=
  ∀ e ∈ development, e ∉ heldout
theorem heldout_not_development (d h : List Nat) (ok : DisjointEnvironments d h)
    (e : Nat) (he : e ∈ h) : e ∉ d := by
  intro hd
  exact ok e hd he


end Zoo.Hedgehog
