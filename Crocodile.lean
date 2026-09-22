import Core

namespace Zoo.Crocodile


/-- Source metrics.py: difference in differences of four supplied means. -/
def did (treatedPost treatedPre controlPost controlPre : Float) : Float :=
  (treatedPost-treatedPre)-(controlPost-controlPre)
def exactDid (tp tpre cp cpre : Int) : Int := (tp-tpre)-(cp-cpre)
theorem common_shift_cancels (tp tpre cp cpre shift : Int) :
    exactDid (tp+shift) (tpre+shift) (cp+shift) (cpre+shift) = exactDid tp tpre cp cpre := by
  unfold exactDid
  omega
structure Identification where
  validAssignment : Prop
  noInterference : Prop
  parallelTrends : Prop
  noAnticipation : Prop
/-- These are external scientific assumptions, not axioms asserted by this project. -/
def CausalInterpretation (d : Identification) : Prop :=
  d.validAssignment ∧ d.noInterference ∧ d.parallelTrends ∧ d.noAnticipation
theorem causal_requires_design (d : Identification) (h : CausalInterpretation d) :
    d.validAssignment := h.1


end Zoo.Crocodile
