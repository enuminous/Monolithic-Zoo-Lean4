import Core

namespace Zoo.Bat


inductive Verdict where | placeboFailure | survives | weak | baselineExplains deriving Repr, DecidableEq, BEq
structure Input where
  gain : Float
  placeboGain : Float
  incrementalBrier : Float
  placeboBrier : Float
  materialGain : Float := 0.002
  deriving Repr
/-- Source bat.py branch ordering, including the 1e-6 placebo tolerance. -/
def run (x : Input) : Verdict :=
  if x.placeboGain ≥ x.gain - 0.000001 ∧ x.gain > 0.0 then .placeboFailure
  else if x.gain ≥ x.materialGain ∧ x.incrementalBrier < x.placeboBrier then .survives
  else if x.gain > 0.0 ∧ x.incrementalBrier < x.placeboBrier then .weak
  else .baselineExplains
theorem placebo_has_priority (x : Input)
    (h : x.placeboGain ≥ x.gain - 0.000001 ∧ x.gain > 0.0) :
    run x = .placeboFailure := by simp [run, h]


end Zoo.Bat
