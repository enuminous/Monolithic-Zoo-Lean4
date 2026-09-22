import Core

namespace Zoo.Axolotl


structure Input where
  referenceFunction : Float
  damagedFunction : Float
  adaptedFunction : Float
  cost : Float
  transformation : Float
  invariantRetention : Float
  deriving Repr
def recovery (x : Input) : Float :=
  let d := x.referenceFunction-x.damagedFunction
  if d > 0.0 then (x.adaptedFunction-x.damagedFunction)/(d+0.000000001)
  else if x.adaptedFunction ≥ x.referenceFunction then 1.0 else 0.0
def efficiency (x : Input) : Float := pos (x.adaptedFunction-x.damagedFunction)/maxF 0.000000001 x.cost
def resilience (x : Input) : Float :=
  let r := clip01 (recovery x)
  let e := efficiency x
  let transform := clip01 x.transformation*r*x.invariantRetention
  clip01 (0.45*r+0.30*x.invariantRetention+0.15*(e/(1.0+e))+0.10*transform)
/-- Functional recovery and invariant retention are separate obligations. -/
def Acceptable (x : Input) (minimumRecovery : Float) : Prop :=
  recovery x ≥ minimumRecovery ∧ x.invariantRetention = 1.0
theorem acceptable_retains_invariants (x : Input) (r : Float) (h : Acceptable x r) :
    x.invariantRetention = 1.0 := h.2


end Zoo.Axolotl
