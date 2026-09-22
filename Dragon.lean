import Core

/-! Attractor and regime transitions. Source: Dragon/features.py.
This module ports final rank aggregation over supplied component columns.
Feature extraction, estimators, training, and experiment orchestration are NOT ported.
The input order is the source component order, followed by horizon components.
NaN/Inf cleanup must occur before this finite-input specification is used. -/
namespace Zoo.Dragon

def baseComponents : List String := ["out['escape_pressure']", "out['assigned_distance']", "out['velocity']", "out['acceleration']", "out['direction_change']", "1.0 / (out['regime_run_length'] + 1.0)", "1.0 - out['recursive_attractor_strength'].rank(pct=True)"]
def horizonComponents : List String := ["out[f'distance_mean_{h}']", "out[f'escape_mean_{h}']", "out[f'velocity_mean_{h}']", "1.0 - out[f'persistence_mean_{h}']"]
def expectedColumns (horizons : Nat) : Nat := 7 + 4 * horizons

structure Input where
  data : RankedInput
  horizonCount : Nat
  deriving Repr

def Valid (x : Input) : Prop := ValidRanked x.data (expectedColumns x.horizonCount)
def run (x : Input) : List Float := rankScores x.data.columns x.data.rows

theorem output_length (x : Input) : (run x).length = x.data.rows := by
  simp [run, rankScores]

theorem valid_column_count (x : Input) (h : Valid x) :
    x.data.columns.length = expectedColumns x.horizonCount := h.1

/-- Contract requirement, not a claim that the upstream trainer enforces it. -/
def Reportable (x : Input) (c : AuditContext) : Prop := Valid x ∧ Admissible c

theorem report_requires_freeze (x : Input) (c : AuditContext) (h : Reportable x c) :
    c.frozenBeforeOutcome = true := h.2.1

end Zoo.Dragon
