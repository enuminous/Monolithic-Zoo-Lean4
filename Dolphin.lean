import Core

/-! Latent-state reconstruction. Source: Dolphin/features.py.
This module ports final rank aggregation over supplied component columns.
Feature extraction, estimators, training, and experiment orchestration are NOT ported.
The input order is the source component order, followed by horizon components.
NaN/Inf cleanup must occur before this finite-input specification is used. -/
namespace Zoo.Dolphin

def baseComponents : List String := ["out['relational_residual_mean']", "out['relational_residual_max']", "out['relational_dispersion']", "out['reconstruction_error']", "out['missing_fraction']", "out['latent_velocity'].clip(lower=0)", "out['latent_acceleration'].clip(lower=0)"]
def horizonComponents : List String := ["out[f'residual_mean_{h}']", "out[f'reconstruction_mean_{h}']", "out[f'missing_mean_{h}']", "out[f'velocity_mean_{h}'].clip(lower=0)"]
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

end Zoo.Dolphin
