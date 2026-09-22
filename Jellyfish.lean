import Core

namespace Zoo.Jellyfish


structure Edge where
  baseWeight : Float
  stressGain : Float
  confidence : Float
  deriving Repr
def dynamicWeight (e : Edge) (stress : Float) : Float :=
  pos (e.baseWeight+e.stressGain*stress)*e.confidence
def flow (e : Edge) (stress sourceHealth : Float) : Float :=
  dynamicWeight e stress * (1.0-sourceHealth)
def nextHealth (health alpha incoming : Float) : Float :=
  1.0-clip01 ((1.0-health)+alpha*incoming)
def harm (health severity recoveryCost : Float) : Float :=
  (1.0-health)*severity + recoveryCost*(1.0-health)
/-- Source computes every next state from the old snapshot (synchronous update). -/
def synchronous {α : Type} (step : α → α) (nodes : List α) : List α := nodes.map step
theorem node_count_preserved {α : Type} (step : α → α) (nodes : List α) :
    (synchronous step nodes).length = nodes.length := by simp [synchronous]


end Zoo.Jellyfish
