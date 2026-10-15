import Std

/-! Frozen decision-stage semantics for extensions outside the original 46.
The inputs are typed summaries of source observations. Constructing those
observations and checking their truth are separate obligations. -/

namespace Zoo.Extensions

inductive Gate where
  | pass | fail | na
  deriving DecidableEq, BEq, Repr

namespace Chimera
structure Event where
  classical : Bool
  quantum : Bool
  key : Bool
  recoveryMap : Bool
  recursive : Bool
  recovered : Bool
  sufficient : Bool
  deriving DecidableEq, Repr

def tags (e : Event) : List String :=
  let ts := (if !e.sufficient then ["U"] else []) ++
    (if e.quantum then ["Q"] else []) ++
    (if e.classical then ["C"] else []) ++
    (if e.key && e.recoveryMap then ["K"] else []) ++
    (if e.recursive then ["R"] else []) ++
    (if !e.recovered && e.sufficient then ["D"] else [])
  if ts.isEmpty then ["U"] else ts

theorem key_iff (e : Event) : "K" ∈ tags e ↔ e.key = true ∧ e.recoveryMap = true := by
  rcases e with ⟨a,b,c,d,e,f,g⟩
  cases a <;> cases b <;> cases c <;> cases d <;> cases e <;> cases f <;> cases g <;> decide

theorem nonempty (e : Event) : tags e ≠ [] := by
  rcases e with ⟨a,b,c,d,e,f,g⟩
  cases a <;> cases b <;> cases c <;> cases d <;> cases e <;> cases f <;> cases g <;> decide
end Chimera

namespace Circus
structure Summary where
  missingMaterial : Bool
  materialNA : Bool
  materialUnknown : Bool
  feedback : Bool
  riskOpen : Bool
  checkFailed : Bool
  checksIncomplete : Bool
  hasChecks : Bool
  deriving DecidableEq, Repr

def decideGate (s : Summary) : Gate :=
  if s.feedback || s.riskOpen || s.checkFailed then .fail
  else if s.missingMaterial || s.materialNA || s.materialUnknown || s.checksIncomplete || !s.hasChecks
    then .na else .pass

theorem failure_precedes_missing (s : Summary)
    (h : (s.feedback || s.riskOpen || s.checkFailed) = true) : decideGate s = .fail := by
  simp [decideGate, h]

theorem pass_requires_checks (s : Summary) (h : decideGate s = .pass) : s.hasChecks = true := by
  cases hs : s.hasChecks <;> simp_all [decideGate]
  split at h <;> simp_all
end Circus

namespace Monster
structure Summary where
  preregistered : Bool
  protocolPresent : Bool
  tolerancePresent : Bool
  matchedBaseline : Bool
  hasConditions : Bool
  hasMandatory : Bool
  violation : Bool
  observedBoundary : Bool
  incomplete : Bool
  unknownBoundary : Bool
  deriving DecidableEq, Repr

def eligible (s : Summary) : Bool :=
  s.preregistered && s.protocolPresent && s.tolerancePresent && s.matchedBaseline &&
    s.hasConditions && s.hasMandatory

def decideGate (s : Summary) : Gate :=
  if !eligible s then .na
  else if s.violation || s.observedBoundary then .fail
  else if s.incomplete || s.unknownBoundary then .na else .pass

theorem violation_precedes_missing (s : Summary) (he : eligible s = true)
    (hv : (s.violation || s.observedBoundary) = true) : decideGate s = .fail := by
  simp [decideGate, he, hv]

theorem ineligible (s : Summary) (he : eligible s = false) : decideGate s = .na := by
  simp [decideGate, he]
end Monster

namespace Woodpecker
inductive Disposition where
  | necessary | contributory | redundant | indeterminate
  deriving DecidableEq, BEq, Repr

/-- Summary of the source's validation and two ordered threshold comparisons.
Threshold arithmetic and input parsing are not inferred from these booleans. -/
def classify (valid lossWithinTolerance lossExceedsNecessity : Bool) : Disposition :=
  if !valid then .indeterminate
  else if lossWithinTolerance then .redundant
  else if lossExceedsNecessity then .necessary else .contributory

theorem invalid_is_indeterminate (within exceeds : Bool) :
    classify false within exceeds = .indeterminate := by rfl

theorem necessary_requires_both_thresholds (valid within exceeds : Bool) :
    classify valid within exceeds = .necessary ↔
      valid = true ∧ within = false ∧ exceeds = true := by
  cases valid <;> cases within <;> cases exceeds <;> decide
end Woodpecker

namespace Nightingale
inductive Stop where
  | insufficientSupport | belowTolerance | instability | maxDepth | continueGrowing
  deriving DecidableEq, BEq, Repr

/-- Exact precedence of `_grow`'s stopping tests once statistics are computed. -/
def stop (smallSupport smallEffect unstable depthReached : Bool) : Stop :=
  if smallSupport then .insufficientSupport
  else if smallEffect then .belowTolerance
  else if unstable then .instability
  else if depthReached then .maxDepth else .continueGrowing

theorem continue_iff (a b c d : Bool) :
    stop a b c d = .continueGrowing ↔ a = false ∧ b = false ∧ c = false ∧ d = false := by
  cases a <;> cases b <;> cases c <;> cases d <;> decide

theorem support_has_priority (a b c : Bool) :
    stop true a b c = .insufficientSupport := by rfl
end Nightingale
end Zoo.Extensions
