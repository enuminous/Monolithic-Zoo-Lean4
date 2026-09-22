import Core

namespace Zoo.Butterfly


structure Layer where
  state : Float
  base : Float := 0.0
  gain : Float := 1.0
  threshold : Float := 1.0
  deriving Repr
def stepLayer (l : Layer) (incoming : Float) : Float :=
  let nonlinear := if l.state > l.threshold then l.gain*square (l.state-l.threshold) else 0.0
  clip 0.0 2.0 (l.base+incoming+nonlinear)
def amplification (totalDeviation delta : Float) : Float := totalDeviation/(absF delta+0.000000001)
def run {α : Type} (step : α → α) : Nat → α → List α
  | 0, state => [state]
  | n+1, state => state :: run step n (step state)
theorem run_records_initial_and_steps {α : Type} (step : α → α) (n : Nat) (s : α) :
    (run step n s).length = n+1 := by
  induction n generalizing s with
  | zero => rfl
  | succ n ih => simp [run, ih]


end Zoo.Butterfly
