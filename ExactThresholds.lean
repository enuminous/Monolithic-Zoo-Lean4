import Extensions

/-! Exact integer-scaled WOODPECKER arithmetic. Measurements share an arbitrary
positive scale; fractionNumerator/fractionDenominator is an exact rational.
The validation flags summarize the upstream evidence/parser checks, not truth
of those checks. Binary64 conformance is only claimed for certified examples. -/
namespace Zoo.ExactThresholds
open Extensions.Woodpecker

structure Case where
  baseline : Int
  ablated : Int
  epsilon : Int
  fractionNumerator : Int
  fractionDenominator : Int
  higherIsBetter : Bool
  evidenceValid : Bool
  deriving Repr, DecidableEq

def orientedBaseline (c : Case) : Int := if c.higherIsBetter then c.baseline else -c.baseline
def orientedAblated (c : Case) : Int := if c.higherIsBetter then c.ablated else -c.ablated
def loss (c : Case) : Int := orientedBaseline c - orientedAblated c

def valid (c : Case) : Prop := c.evidenceValid = true ∧ 0 ≤ c.epsilon ∧
  0 < c.fractionDenominator ∧ 0 ≤ c.fractionNumerator ∧
  c.fractionNumerator ≤ c.fractionDenominator
instance (c : Case) : Decidable (valid c) := inferInstanceAs (Decidable (_ ∧ _ ∧ _ ∧ _ ∧ _))

/-- The source's maximum threshold, with denominators cleared exactly. -/
def threshold (c : Case) : Int := max (c.epsilon*c.fractionDenominator)
  ((orientedBaseline c).natAbs * (c.fractionDenominator-c.fractionNumerator))

def evaluate (c : Case) : Disposition :=
  if valid c then
    if loss c ≤ c.epsilon then .redundant
    else if threshold c < loss c*c.fractionDenominator then .necessary else .contributory
  else .indeterminate

theorem redundant_iff (c : Case) :
    evaluate c = .redundant ↔ valid c ∧ loss c ≤ c.epsilon := by
  unfold evaluate
  split <;> rename_i hv
  · split <;> rename_i hl
    · simp [hv, hl]
    · split <;> simp_all
  · simp [hv]

theorem necessary_iff (c : Case) : evaluate c = .necessary ↔
    valid c ∧ threshold c < loss c*c.fractionDenominator := by
  have hthreshold := Int.le_max_left (c.epsilon*c.fractionDenominator)
    ((orientedBaseline c).natAbs * (c.fractionDenominator-c.fractionNumerator))
  change c.epsilon*c.fractionDenominator ≤ threshold c at hthreshold
  have hstrict (hv : valid c) (h : threshold c < loss c*c.fractionDenominator) :
      ¬loss c ≤ c.epsilon := by
    have he := Int.lt_of_mul_lt_mul_right (Int.lt_of_le_of_lt hthreshold h)
      (Int.le_of_lt hv.2.2.1)
    omega
  unfold evaluate
  split <;> rename_i hv
  · split <;> rename_i hl
    · constructor
      · intro h; cases h
      · intro h; exact False.elim (hstrict hv h.2 hl)
    · split <;> simp_all
  · simp [hv]

theorem contributory_iff (c : Case) : evaluate c = .contributory ↔
    valid c ∧ c.epsilon < loss c ∧ loss c*c.fractionDenominator ≤ threshold c := by
  unfold evaluate
  split <;> rename_i hv
  · split <;> rename_i hl
    · simp [hv]; omega
    · split <;> rename_i ht
      · simp [hv]; omega
      · simp [hv]; omega
  · simp [hv]

theorem invalid_iff (c : Case) : evaluate c = .indeterminate ↔ ¬valid c := by
  unfold evaluate
  split <;> rename_i hv
  · split <;> simp_all
    split <;> simp_all
  · simp [hv]

/-- Reversing metric direction and both measurements preserves classification. -/
def reverseMetric (c : Case) : Case :=
  {c with baseline := -c.baseline, ablated := -c.ablated, higherIsBetter := !c.higherIsBetter}

theorem reversal_invariant (c : Case) : evaluate (reverseMetric c) = evaluate c := by
  cases h : c.higherIsBetter <;>
    simp [evaluate, reverseMetric, valid, loss, orientedBaseline, orientedAblated, threshold, h]
end Zoo.ExactThresholds
