import Core

namespace Zoo.Mantis


inductive State where | calibrating | stable | precursor | intervene deriving Repr, DecidableEq, BEq
structure Input where
  ready : Bool
  zVariance : Float
  zAutocorrelation : Float
  zCurvature : Float
  threshold : Float := 2.0
  minCoherence : Float := 0.5
  deriving Repr
def precursor (x : Input) : Float := meanF [pos x.zVariance, pos x.zAutocorrelation, pos x.zCurvature]
def coherence (x : Input) : Float :=
  boolFraction [decide (x.zVariance > 0.0), decide (x.zAutocorrelation > 0.0), decide (x.zCurvature > 0.0)]
def run (x : Input) : State :=
  if x.ready = false then .calibrating
  else if precursor x ≥ x.threshold ∧ coherence x ≥ x.minCoherence then .intervene
  else if precursor x ≥ x.threshold*0.6 then .precursor else .stable
theorem unready_calibrates (x : Input) (h : x.ready = false) : run x = .calibrating := by
  simp [run, h]


end Zoo.Mantis
