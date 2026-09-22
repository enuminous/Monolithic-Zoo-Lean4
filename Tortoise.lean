import Core

namespace Zoo.Tortoise


/-- Source tortoise.py: ordered split after caller has sorted by time. -/
def splitAtCut {α : Type} (cut : Nat) (xs : List α) : List α × List α :=
  (xs.take cut, xs.drop cut)
theorem split_reconstructs {α : Type} (cut : Nat) (xs : List α) :
    (splitAtCut cut xs).1 ++ (splitAtCut cut xs).2 = xs := by
  simp [splitAtCut]
def gain (s : ForecastScore) : Float := brierGain s
/-- Explicit prospective-evaluation obligation; not an implementation guarantee. -/
def Prospective (lastTraining firstTest cutoff : Nat) : Prop :=
  lastTraining ≤ cutoff ∧ cutoff < firstTest
theorem train_precedes_test (a b c : Nat) (h : Prospective a b c) : a < b := by
  exact Nat.lt_of_le_of_lt h.1 h.2


end Zoo.Tortoise
