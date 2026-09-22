import Core

namespace Zoo.Mole


structure Input where
  indicatorsPresent : Bool
  surfaceHealth : Float
  latentDegradation : Float
  coverage : Float
  gapThreshold : Float := 0.25
  minimumCoverage : Float := 0.5
  deriving Repr
def gap (x : Input) : Float := pos (x.latentDegradation-(1.0-clip01 x.surfaceHealth))
def hiddenFailure (x : Input) : Bool :=
  x.indicatorsPresent && decide (gap x ≥ x.gapThreshold ∧ x.coverage ≥ x.minimumCoverage)
theorem no_indicators_no_failure_claim (x : Input) (h : x.indicatorsPresent = false) :
    hiddenFailure x = false := by simp [hiddenFailure, h]


end Zoo.Mole
