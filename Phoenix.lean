import Core

namespace Zoo.Phoenix


def completeness (fidelity integrity capability : Float) : Float :=
  0.4*fidelity+0.3*integrity+0.3*capability
/-- Source phoenix.py hold-window rule. Zero hold is preserved, not silently repaired. -/
def StableWindow (scores : List Float) (hold : Nat) (threshold : Float) : Prop :=
  scores.length = hold ∧ ∀ s ∈ scores, s ≥ threshold
theorem stable_requires_every_checkpoint (s : List Float) (h : Nat) (t x : Float)
    (ok : StableWindow s h t) (hx : x ∈ s) : x ≥ t := ok.2 x hx
def stableAt (scores : List Float) (start hold : Nat) (threshold : Float) : Bool :=
  let window := (scores.drop start).take hold
  decide (window.length = hold) && window.all (fun x => decide (x ≥ threshold))


end Zoo.Phoenix
