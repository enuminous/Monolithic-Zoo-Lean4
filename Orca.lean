import Core

namespace Zoo.Orca


structure Handoff where
  acknowledged : Bool
  payloadComplete : Bool
  ownershipClear : Bool
  dependencyComplete : Bool
  deriving Repr
def handoffIntegrity (h : Handoff) : Float :=
  boolFraction [h.acknowledged,h.payloadComplete,h.ownershipClear,h.dependencyComplete]
def Complete (h : Handoff) : Prop :=
  h.acknowledged = true ∧ h.payloadComplete = true ∧ h.ownershipClear = true ∧ h.dependencyComplete = true
theorem complete_requires_ack (h : Handoff) (ok : Complete h) : h.acknowledged = true := ok.1
def coordination (consistency integrity conflict ambiguity lag : Float) : Float :=
  0.30*consistency+0.30*integrity+0.20*(1.0-conflict)+0.10*(1.0-ambiguity)+
    0.10*(1.0-minF 1.0 (lag/10.0))


end Zoo.Orca
