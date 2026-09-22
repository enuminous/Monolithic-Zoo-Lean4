import Std

/-! Shared operational kernels. Float functions are executable specifications, not
proofs of IEEE-754 equivalence to NumPy. Empirical outcomes remain external data. -/
namespace Zoo

inductive EvidenceStatus where
  | demonstrated | supportedIncomplete | hypothesis | unresolved | rejected
  deriving Repr, BEq, DecidableEq

structure AuditContext where
  frozenBeforeOutcome : Bool
  noTargetLeakage : Bool
  matchedInformation : Bool
  independentOutcome : Bool
  deriving Repr

def Admissible (c : AuditContext) : Prop :=
  c.frozenBeforeOutcome = true ∧ c.noTargetLeakage = true ∧
  c.matchedInformation = true ∧ c.independentOutcome = true

theorem admissible_no_leakage (c : AuditContext) (h : Admissible c) :
    c.noTargetLeakage = true := h.2.1

theorem not_admissible_if_unfrozen (c : AuditContext)
    (h : c.frozenBeforeOutcome = false) : ¬ Admissible c := by
  intro hc
  have hx := hc.1
  rw [h] at hx
  cases hx

structure ForecastScore where
  candidateBrier : Float
  controlBrier : Float
  deriving Repr

def brierGain (s : ForecastScore) : Float := s.controlBrier - s.candidateBrier

def sumF (xs : List Float) : Float := xs.foldl (fun a b => a + b) 0.0
/-- Counts must be below 2^64 when converted to Float. -/
def natFloat (n : Nat) : Float := n.toUInt64.toFloat

def meanF (xs : List Float) : Float :=
  if xs.isEmpty then 0.0 else sumF xs / natFloat xs.length

def absF (x : Float) : Float := if x < 0.0 then -x else x
def pos (x : Float) : Float := if x < 0.0 then 0.0 else x
def minF (a b : Float) : Float := if a < b then a else b
def maxF (a b : Float) : Float := if a < b then b else a
def clip (lo hi x : Float) : Float := maxF lo (minF hi x)
def clip01 (x : Float) : Float := clip 0.0 1.0 x
def square (x : Float) : Float := x*x
def ema (rho previous current : Float) : Float := rho*previous + (1.0-rho)*current

def boolFraction (xs : List Bool) : Float :=
  if xs.isEmpty then 1.0 else natFloat (xs.filter id).length / natFloat xs.length

/-- Pandas average-tie percentile rank for a finite, non-NaN column member. -/
def rankPct (x : Float) (column : List Float) : Float :=
  let less := (column.filter (fun y => decide (y < x))).length
  let equal := (column.filter (fun y => y == x)).length
  if column.isEmpty then 0.0
  else natFloat (2*less+equal+1) / natFloat (2*column.length)

/-- The dataset is explicit: full-column ranking may use future rows. -/
def rankMean (columns : List (List Float)) (row : Nat) : Float :=
  meanF (columns.map (fun c => rankPct (c.getD row 0.0) c))

def rankScores (columns : List (List Float)) (rows : Nat) : List Float :=
  (List.range rows).map (rankMean columns)

theorem rankScores_length (columns : List (List Float)) (rows : Nat) :
    (rankScores columns rows).length = rows := by simp [rankScores]

structure RankedInput where
  columns : List (List Float)
  rows : Nat
  deriving Repr

def ValidRanked (x : RankedInput) (expected : Nat) : Prop :=
  x.columns.length = expected ∧ 0 < expected ∧
  ∀ c ∈ x.columns, c.length = x.rows

/-- First matching index, with an explicit offset. -/
def firstIndexFrom {α : Type} (p : α → Bool) : Nat → List α → Option Nat
  | _, [] => none
  | n, x :: xs => if p x then some n else firstIndexFrom p (n+1) xs

def firstIndex {α : Type} (p : α → Bool) (xs : List α) : Option Nat :=
  firstIndexFrom p 0 xs

theorem firstIndex_nil {α : Type} (p : α → Bool) : firstIndex p [] = none := rfl

/-- Caller-supplied evidence cannot be promoted by counting repeated copies. -/
structure EvidenceRecord where
  group : Nat
  applicable : Bool
  vetoOnFailure : Bool
  negative : Bool
  deriving Repr

def veto (r : EvidenceRecord) : Bool := r.applicable && r.vetoOnFailure && r.negative

def hasVeto (rs : List EvidenceRecord) : Bool := rs.any veto

theorem hasVeto_cons (r : EvidenceRecord) (rs : List EvidenceRecord)
    (h : veto r = true) : hasVeto (r :: rs) = true := by
  simp [hasVeto, h]

/-- Exact integer numerator of the fixed 97/100, 3/100 recurrence. -/
def memoryNumerator (previous residual : Int) : Int := 97*previous + 3*residual

theorem memoryNumerator_sign (p r : Int) :
    memoryNumerator (-p) (-r) = -memoryNumerator p r := by
  unfold memoryNumerator
  omega

theorem memoryNumerator_zero : memoryNumerator 0 0 = 0 := by decide

end Zoo
