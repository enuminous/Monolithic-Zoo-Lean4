import Core

namespace Zoo.Bison


structure Input where
  demand : Float
  queue : Float
  capacity : Float
  queueLimit : Float
  deriving Repr
structure Output where
  served : Float
  queue : Float
  dropped : Float
  deriving Repr
/-- Source bison.py per-component queue update; retry injection remains zero upstream. -/
def step (x : Input) : Output :=
  let d := pos x.demand
  let served := minF (d+x.queue) (pos x.capacity)
  let q := pos (x.queue+d-served)
  ⟨served, minF q x.queueLimit, pos (q-x.queueLimit)⟩
/-- Exact nonnegative integral-queue reference, with truncated subtraction. -/
def queueNat (queue demand capacity limit : Nat) : Nat := min (queue+demand-capacity) limit
theorem queue_bounded (q d c l : Nat) : queueNat q d c l ≤ l := Nat.min_le_right _ _


end Zoo.Bison
