import Core

namespace Zoo.Lynx


structure Input where
  distance : Float
  rarity : Float
  rediscovery : Float
  replication : Float
  yieldScore : Float
  alpha : Float := 0.5
  beta : Float := 0.5
  gamma : Float := 0.5
  noveltyThreshold : Float := 0.4
  replicationThreshold : Float := 0.6
  deriving Repr
def novelty (x : Input) : Float := pos (x.alpha*x.distance+x.beta*x.rarity-x.gamma*x.rediscovery)
def latentYield (x : Input) : Float := novelty x * clip01 x.replication * clip01 x.yieldScore
def Emergent (x : Input) : Prop := novelty x ≥ x.noveltyThreshold ∧ x.replication ≥ x.replicationThreshold
theorem emergent_requires_replication (x : Input) (h : Emergent x) :
    x.replication ≥ x.replicationThreshold := h.2


end Zoo.Lynx
