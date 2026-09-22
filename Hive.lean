import Core

/-! Organizational reliability. Source: Hive/features.py.
This module ports final rank aggregation over supplied component columns.
Feature extraction, estimators, training, and experiment orchestration are NOT ported.
The input order is the source component order, followed by horizon components.
NaN/Inf cleanup must occur before this finite-input specification is used. -/
namespace Zoo.Hive

def baseComponents : List String := ["out['interaction_stress']", "out['interaction_variance']", "out['delivery_pressure']", "out['coordination_load']", "out['throughput_conflict']"]
def horizonComponents : List String := ["out[f'stress_mean_{h}']", "out[f'pressure_mean_{h}']", "out[f'coordination_mean_{h}']", "out[f'conflict_mean_{h}']"]
def expectedColumns (horizons : Nat) : Nat := 5 + 4 * horizons

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

end Zoo.Hive
