import Core

namespace Zoo.Chameleon


/-- Source chameleon.py; centroids and pairwise distances are supplied. -/
def unexplained (distance expectedAdaptation : Float) : Float := pos (distance-expectedAdaptation)
def noiseAdjusted (between within : Float) : Float := pos (between-within)
/-- Exact-integer abstraction of the nonnegative excess, not floating-point equivalence. -/
def excess (observed expected : Int) : Int := max 0 (observed-expected)
theorem excess_nonnegative (a b : Int) : 0 ≤ excess a b := by
  exact Int.le_max_left 0 (a-b)
theorem expected_explains (a b : Int) (h : a ≤ b) : excess a b = 0 := by
  unfold excess
  omega


end Zoo.Chameleon
