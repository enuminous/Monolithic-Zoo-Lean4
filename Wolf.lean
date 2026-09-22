import Core

namespace Zoo.Wolf


structure Channel where
  hazard : Float
  velocity : Float
  uncertainty : Float
  reliability : Float
  deriving Repr
def localContribution (c : Channel) (alpha beta gamma : Float) : Float :=
  pos (alpha*c.hazard + beta*c.velocity - gamma*pos c.uncertainty)
def weight (c : Channel) : Float := pos c.reliability / (1.0+pos c.uncertainty)
/-- Source wolf.py: alarm requires all three independent gates. -/
def Alarm (score effective coherence threshold minimumChannels minimumCoherence : Float) : Prop :=
  score > threshold ∧ effective ≥ minimumChannels ∧ coherence ≥ minimumCoherence
theorem alarm_requires_distributed_support (s e c t n k : Float)
    (h : Alarm s e c t n k) : e ≥ n := h.2.1
def update (rho previous instantaneous : Float) : Float := ema rho previous instantaneous


end Zoo.Wolf
