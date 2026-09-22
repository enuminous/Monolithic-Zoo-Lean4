import Core

namespace Zoo.Rhino


def retention (baseline after : Float) : Float :=
  if baseline == 0.0 then (if after == 0.0 then 1.0 else 0.0) else clip01 (after/baseline)
def shockAmplification (performance structural magnitude : Float) : Float :=
  (1.0-(0.5*performance+0.5*structural))/maxF 0.000000001 magnitude
def gracefulFailure (invariants performance : Float) : Float := clip01 (0.6*invariants+0.4*performance)
/-- Domain invariants stay caller-supplied predicates, never assumed true. -/
def Survives {α : Type} (state : α) (invariants : List (α → Prop)) : Prop :=
  ∀ p ∈ invariants, p state
theorem survives_selected_invariant {α : Type} (s : α) (ps : List (α → Prop))
    (p : α → Prop) (h : Survives s ps) (hp : p ∈ ps) : p s := h p hp


end Zoo.Rhino
