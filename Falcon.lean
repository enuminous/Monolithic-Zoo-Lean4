import Core

namespace Zoo.Falcon


/-- Source falcon.py latency_metrics, exact integer time abstraction. -/
def reactionMargin (hazard alarm delay : Int) : Int := hazard-(alarm+delay)
def Missed (hazard alarm delay : Int) : Prop := hazard ≤ alarm+delay
theorem positive_margin_iff_on_time (h a d : Int) :
    0 < reactionMargin h a d ↔ ¬ Missed h a d := by
  unfold reactionMargin Missed
  omega
structure Timing where
  detectionLatency : Int
  interventionLatency : Int
  reactionMargin : Int
  missed : Bool
  deriving Repr
def latency (event hazard : Int) (alarm : Option Int) (delay : Int) : Option Timing :=
  alarm.map (fun a => ⟨a-event, delay, reactionMargin hazard a delay, decide (hazard ≤ a + delay)⟩)
theorem absent_alarm_no_timing (e h d : Int) : latency e h none d = none := rfl


end Zoo.Falcon
