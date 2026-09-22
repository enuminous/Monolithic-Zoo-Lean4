import Core

namespace Zoo.Horse


structure Handoff where
  statePreserved : Bool
  uncertaintyPreserved : Bool
  historyPreserved : Bool
  constraintsPreserved : Bool
  responsibilityClear : Bool
  deriving Repr
def Complete (h : Handoff) : Prop :=
  h.statePreserved = true ∧ h.uncertaintyPreserved = true ∧ h.historyPreserved = true ∧
  h.constraintsPreserved = true ∧ h.responsibilityClear = true
theorem handoff_retains_uncertainty (h : Handoff) (ok : Complete h) :
    h.uncertaintyPreserved = true := ok.2.1
def trustError (trust reliability : Float) : Float := absF (clip01 trust-clip01 reliability)
def workloadPenalty (workload attention fatigue : Float) : Float :=
  minF 1.0 (pos (clip01 workload-0.7)+0.5*(1.0-clip01 attention)+0.5*clip01 fatigue)
def jointEffectiveness (success handoff trustErr workload intervention latency : Float) : Float :=
  clip01 (0.35*clip01 success+0.20*handoff+0.20*(1.0-trustErr)+0.15*(1.0-workload)+
    0.10*((clip (-1.0) 1.0 intervention+1.0)/2.0)-0.05*minF 1.0 (pos latency/10.0))


end Zoo.Horse
