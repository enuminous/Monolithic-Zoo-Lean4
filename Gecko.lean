import Core

/-! Mechanical degradation. Source: Gecko/features.py.
This module ports final rank aggregation over supplied component columns.
Feature extraction, estimators, training, and experiment orchestration are NOT ported.
The input order is the source component order, followed by horizon components.
NaN/Inf cleanup must occur before this finite-input specification is used. -/
namespace Zoo.Gecko

def baseComponents : List String := ["out['coherence_loss']", "out['kinetic_outlier']", "out['gradient_loss']", "out['kinetic_gradient']"]
def horizonComponents : List String := ["out[f'coherence_loss_mean_{h}']", "out[f'kinetic_outlier_mean_{h}']", "out[f'gradient_loss_mean_{h}']", "out[f'kinetic_gradient_mean_{h}']"]
def expectedColumns (horizons : Nat) : Nat := 4 + 4 * horizons

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

end Zoo.Gecko
