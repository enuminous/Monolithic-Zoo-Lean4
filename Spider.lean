import Core

/-! Network-cascade precursors. Source: Spider/features.py.
This module ports final rank aggregation over supplied component columns.
Feature extraction, estimators, training, and experiment orchestration are NOT ported.
The input order is the source component order, followed by horizon components.
NaN/Inf cleanup must occur before this finite-input specification is used. -/
namespace Zoo.Spider

def baseComponents : List String := ["out['edge_stress_mean']", "out['edge_stress_max']", "out['edge_stress_dispersion']", "out['edge_stress_concentration']", "out['edge_velocity_positive']", "out['local_global_divergence']"]
def horizonComponents : List String := ["out[f'stress_mean_{h}']", "out[f'stress_max_{h}']", "out[f'velocity_mean_{h}']", "out[f'divergence_mean_{h}']"]
def expectedColumns (horizons : Nat) : Nat := 6 + 4 * horizons

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

end Zoo.Spider
