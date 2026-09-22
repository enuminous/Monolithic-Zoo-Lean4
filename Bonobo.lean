import Core

namespace Zoo.Bonobo


def gain (baseline utility : Float) : Float := utility-baseline
def exploitation (gains : List Float) : Float := sumF (gains.map (fun g => pos (-g)))
def cooperativeScore (efficiency stability fairnessDispersion exploit resolution : Float) : Float :=
  clip01 (0.30*efficiency+0.25*clip01 stability+0.20/(1.0+fairnessDispersion)+
    0.15*(1.0-clip01 exploit)+0.10*clip01 resolution)
/-- Exact integer utility abstraction for an all-participants gain claim. -/
def MutualGain (gains : List Int) : Prop := ∀ g ∈ gains, 0 ≤ g
theorem mutual_gain_excludes_loser (gs : List Int) (h : MutualGain gs)
    (g : Int) (hg : g ∈ gs) : ¬ g < 0 := by
  have hnonneg := h g hg
  omega


end Zoo.Bonobo
