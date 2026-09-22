import Core

namespace Zoo.Cat


/-- Source cat.py: unlike prediction gain, ablation penalty is ablated minus full. -/
def penalty (ablated full : Float) : Float := ablated-full
inductive Verdict where | removalHurt | removalHelped | noChange deriving Repr, DecidableEq, BEq
def classify (p : Float) : Verdict :=
  if p > 0.0 then .removalHurt else if p < 0.0 then .removalHelped else .noChange
theorem positive_removal_hurt (p : Float) (h : p > 0.0) :
    classify p = .removalHurt := by simp [classify, h]
/-- Exact arithmetic reference for sign convention, separate from Float rounding. -/
def exactPenalty (ablated full : Int) : Int := ablated-full
theorem removal_hurts_iff (a f : Int) : 0 < exactPenalty a f ↔ f < a := by
  unfold exactPenalty
  omega


end Zoo.Cat
