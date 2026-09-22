import Core

namespace Zoo.Salmon


structure Edge where
  source : Nat
  target : Nat
  weight : Float
  deriving Repr
def unresolvedMass (weight : Float) (incoming : List Edge) : Float :=
  weight * pos (1.0-sumF (incoming.map (fun e => clip01 e.weight)))
/-- Bounded ancestry traversal. Fuel-exhausted is distinct from a resolved origin. -/
inductive Trace where
  | origin (id : Nat)
  | exhausted (id : Nat)
  | branch (id : Nat) (parents : List Trace)
  deriving Repr
def trace (parents : Nat → List Nat) : Nat → Nat → Trace
  | 0, id => .exhausted id
  | fuel+1, id =>
    let ps := parents id
    if ps.isEmpty then .origin id else .branch id (ps.map (trace parents fuel))
theorem exhaustion_not_origin (p : Nat → List Nat) (id : Nat) :
    trace p 0 id ≠ Trace.origin id := by simp [trace]


end Zoo.Salmon
