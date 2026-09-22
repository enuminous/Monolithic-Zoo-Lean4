import Core

namespace Zoo.Magpie


structure Input where
  coherence : Float
  directSupport : Float
  provenance : Float
  corroboration : Float
  unsupportedInference : Float
  unresolvedProvenance : Float
  contradiction : Float
  previousGroundedness : Option Float
  threshold : Float := 0.25
  deriving Repr
/-- Source magpie.py; entropy and claim-keyed storage are separate obligations. -/
def groundedness (x : Input) : Float :=
  let n := clip01 x.directSupport + clip01 x.provenance + clip01 x.corroboration
  clip01 (n / (n + clip01 x.unsupportedInference + clip01 x.unresolvedProvenance +
    clip01 x.contradiction + 0.000000000001))
def falling (x : Input) : Bool :=
  match x.previousGroundedness with
  | none => false
  | some previous => decide (groundedness x < previous)
def alarm (x : Input) : Bool :=
  decide (clip01 x.coherence - groundedness x > x.threshold) && falling x
theorem no_history_no_alarm (x : Input) (h : x.previousGroundedness = none) :
    alarm x = false := by simp [alarm, falling, h]


end Zoo.Magpie
