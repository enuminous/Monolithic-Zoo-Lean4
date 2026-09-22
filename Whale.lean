import Core

namespace Zoo.Whale


def cumulativeDeviation (xs : List Float) (baseline : Float) : Float :=
  meanF (xs.map (fun x => absF (x-baseline)))
def historyGap (xs : List Float) (window : Nat) : Float :=
  if xs.isEmpty then 0.0 else absF (meanF (xs.drop (xs.length-window))-meanF xs)
def stability (drift cumulative gap memory driftScale deviationScale gapScale : Float) : Float :=
  pos (1.0-(0.30*minF 1.0 (absF drift*driftScale)+0.25*minF 1.0 (cumulative*deviationScale)+
    0.25*minF 1.0 (gap*gapScale)+0.20*minF 1.0 (memory*gapScale)))
theorem empty_history_zero_gap (w : Nat) : historyGap [] w = 0.0 := by simp [historyGap]


end Zoo.Whale
