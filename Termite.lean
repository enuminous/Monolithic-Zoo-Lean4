import Core

namespace Zoo.Termite


structure Agent where
  state : Float
  susceptibility : Float := 0.5
  bias : Float := 0.0
  deriving Repr
def stepAgent (a : Agent) (weightedSum totalWeight : Float) : Float :=
  let target := if totalWeight > 0.0 then weightedSum/totalWeight else a.state
  clip01 ((1.0-a.susceptibility)*a.state+a.susceptibility*target+a.bias)
def collectiveCoherence (variance : Float) : Float := 1.0/(1.0+variance)
/-- Jacobi-style update reads a single old snapshot for all agents. -/
def synchronous (agents : List Agent) (incoming : Agent → Float × Float) : List Float :=
  agents.map (fun a => stepAgent a (incoming a).1 (incoming a).2)
theorem population_preserved (a : List Agent) (i : Agent → Float × Float) :
    (synchronous a i).length = a.length := by simp [synchronous]


end Zoo.Termite
