import Extensions

/-! Structured reference models for the frozen extension sources.
Chimera and Circus use their annotated string/Boolean/list input domain.
Monster uses integer measurements and thresholds, where comparisons are exact.
JSON decoding, Python's permissive coercions, floating-point comparisons and
command-line I/O are outside these contracts. See SOURCE_RECORD_COVERAGE.md. -/

namespace Zoo.SourceRecords
open Zoo.Extensions

namespace Chimera
structure Event where
  objectName : String
  interaction : String
  facts : Extensions.Chimera.Event
  deriving DecidableEq, Repr

structure Result where
  objectName : String
  interaction : String
  tags : List String
  operationalRecovery : Bool
  notes : List String
  antiCircularity : String
  deriving DecidableEq, Repr

def warningText : String :=
  "Similarity of information structure is not evidence of identity of physical mechanism."

def missingMapNote : String :=
  "A claimed key lacks an explicit recovery map; K withheld."

def classify (e : Event) : Result :=
  ⟨e.objectName, e.interaction, Extensions.Chimera.tags e.facts, e.facts.recovered,
    if e.facts.key && !e.facts.recoveryMap then [missingMapNote] else [], warningText⟩

/-- Sequential list construction in the pinned Python classifier, including
its test of the current tag list before appending D. -/
def reference (e : Event) : Result :=
  let f := e.facts
  let tags := if !f.sufficient then ["U"] else []
  let tags := tags ++ if f.quantum then ["Q"] else []
  let tags := tags ++ if f.classical then ["C"] else []
  let tags := tags ++ if f.key && f.recoveryMap then ["K"] else []
  let notes := if f.key && !f.recoveryMap then [missingMapNote] else []
  let tags := tags ++ if f.recursive then ["R"] else []
  let tags := tags ++ if !f.recovered && !tags.contains "U" then ["D"] else []
  let tags := if tags.isEmpty then ["U"] else tags
  ⟨e.objectName, e.interaction, tags, f.recovered, notes, warningText⟩

/-- All seven Boolean inputs, arbitrary object and interaction strings,
and every returned field are covered, rather than only the tag projection. -/
theorem reference_eq_classify (e : Event) : reference e = classify e := by
  rcases e with ⟨obj, interaction, a, b, c, d, e, f, g⟩
  cases a <;> cases b <;> cases c <;> cases d <;> cases e <;> cases f <;> cases g <;> rfl

theorem metadata_preserved (e : Event) :
    (classify e).objectName = e.objectName ∧
    (classify e).interaction = e.interaction ∧
    (classify e).operationalRecovery = e.facts.recovered := by
  exact ⟨rfl, rfl, rfl⟩

theorem missing_map_is_reported (e : Event) (hk : e.facts.key = true)
    (hm : e.facts.recoveryMap = false) : (classify e).notes = [missingMapNote] := by
  simp [classify, hk, hm]
end Chimera

namespace Circus
structure Stage where
  stage : Option String
  provenance : Option String
  deriving DecidableEq, Repr
structure Dependency where
  materiality : Option String
  feedback : Bool
  deriving DecidableEq, Repr
structure Risk where
  materiality : Option String
  status : Option String
  deriving DecidableEq, Repr
structure Check where
  status : Option String
  frozen : Bool
  independentlySourced : Bool
  deriving DecidableEq, Repr
structure Report where
  pipeline : List Stage
  dependencies : List Dependency
  risks : List Risk
  checks : List Check
  deriving DecidableEq, Repr

def materialStage (p : Stage) : Bool :=
  ["definition", "data_selection", "labels", "scoring", "validation"].any
    (fun s => p.stage == some s)

def missingProvenance (p : Stage) : Bool :=
  materialStage p && !(p.provenance == some "documented")
def openRisk (r : Risk) : Bool :=
  (r.materiality == some "material") &&
    ["present", "unresolved", "na"].any (fun s => r.status == some s)
def badCheck (c : Check) : Bool :=
  !(c.status == some "passed") || !c.frozen || !c.independentlySourced

def summarize (r : Report) : Extensions.Circus.Summary :=
  ⟨r.pipeline.any missingProvenance,
    r.risks.any (fun q => q.materiality == some "material" && q.status == some "na"),
    r.dependencies.any (fun d => d.materiality == some "unknown") ||
      r.risks.any (fun q => q.materiality == some "unknown"),
    r.dependencies.any (fun d => d.materiality == some "material" && d.feedback),
    r.risks.any openRisk,
    r.checks.any (fun c => c.status == some "failed"),
    r.checks.any badCheck, !r.checks.isEmpty⟩

def decideReport (r : Report) : Gate := Extensions.Circus.decideGate (summarize r)

theorem pass_iff_summary (s : Extensions.Circus.Summary) :
    Extensions.Circus.decideGate s = .pass ↔
      s.feedback = false ∧ s.riskOpen = false ∧ s.checkFailed = false ∧
      s.missingMaterial = false ∧ s.materialNA = false ∧ s.materialUnknown = false ∧
      s.checksIncomplete = false ∧ s.hasChecks = true := by
  rcases s with ⟨a,b,c,d,e,f,g,h⟩
  cases a <;> cases b <;> cases c <;> cases d <;> cases e <;> cases f <;> cases g <;> cases h <;> decide

/-- A passing report has at least one independent check. This follows from
the report's actual list, without a supplied hasChecks flag. -/
theorem pass_has_checks (r : Report) (h : decideReport r = .pass) : r.checks ≠ [] := by
  have hs := (pass_iff_summary (summarize r)).mp h
  intro he
  simp [summarize, he] at hs

theorem pass_checks_complete (r : Report) (h : decideReport r = .pass)
    (c : Check) (hc : c ∈ r.checks) :
    c.status = some "passed" ∧ c.frozen = true ∧ c.independentlySourced = true := by
  have hs := (pass_iff_summary (summarize r)).mp h
  have hz : r.checks.any badCheck = false := hs.2.2.2.2.2.2.1
  have hn : badCheck c = false :=
    Bool.of_not_eq_true ((List.any_eq_false.mp hz) c hc)
  have hp : (c.status = some "passed" ∧ c.frozen = true) ∧
      c.independentlySourced = true := by
    simpa [badCheck] using hn
  exact ⟨hp.1.1, hp.1.2, hp.2⟩

/-- A material N/A risk is in the fail set in the actual source. Missing
checks cannot conceal it. -/
theorem material_na_fails (r : Report) (q : Risk) (hq : q ∈ r.risks)
    (hm : q.materiality = some "material") (hs : q.status = some "na") :
    decideReport r = .fail := by
  have hr : r.risks.any openRisk = true :=
    List.any_eq_true.mpr ⟨q, hq, by simp [openRisk, hm, hs]⟩
  simp [decideReport, Extensions.Circus.decideGate, summarize, hr]
end Circus

namespace Monster
/-- Exact integer subdomain of the source's three threshold branches. -/
inductive Tolerance where
  | higher : Int → Tolerance
  | lower : Int → Tolerance
  | interval : Int → Int → Tolerance
  | invalid
  deriving DecidableEq, Repr

def within (value : Option Int) (tolerance : Tolerance) : Bool :=
  match value, tolerance with
  | none, _ => false
  | some v, .higher t => decide (t ≤ v)
  | some v, .lower t => decide (v ≤ t)
  | some v, .interval lo hi => decide (lo ≤ v ∧ v ≤ hi)
  | some _, .invalid => false

structure Condition where
  registered : Bool
  status : Option String
  candidate : Option Int
  baseline : Option Int
  deriving DecidableEq, Repr
structure Report where
  preregistered : Bool
  protocolId : Option String
  tolerance : Option Tolerance
  matchedBaseline : Bool
  conditions : List Condition
  boundaries : List (Option String)
  deriving DecidableEq, Repr

def protocolPresent (r : Report) : Bool :=
  match r.protocolId with | none => false | some s => !s.isEmpty

def violation (t : Tolerance) (c : Condition) : Bool :=
  (c.status == some "complete") && c.candidate.isSome && !within c.candidate t

def incomplete (c : Condition) : Bool :=
  !(c.status == some "complete") || c.candidate.isNone || c.baseline.isNone

def summarize (r : Report) : Extensions.Monster.Summary :=
  let mandatory := r.conditions.filter (fun c => c.registered)
  ⟨r.preregistered, protocolPresent r, r.tolerance.isSome, r.matchedBaseline,
    !r.conditions.isEmpty, !mandatory.isEmpty,
    mandatory.any (violation (r.tolerance.getD .invalid)),
    r.boundaries.any (fun b => b == some "failure_observed"),
    mandatory.any incomplete, r.boundaries.any (fun b => b == some "unknown")⟩

def decideReport (r : Report) : Gate := Extensions.Monster.decideGate (summarize r)

/-- For an eligible report, a registered completed violation remains a failure
regardless of other missing candidate or baseline cells. -/
theorem registered_violation_fails (r : Report)
    (he : Extensions.Monster.eligible (summarize r) = true)
    (c : Condition) (hc : c ∈ r.conditions) (hreg : c.registered = true)
    (hv : violation (r.tolerance.getD .invalid) c = true) :
    decideReport r = .fail := by
  have hm : c ∈ r.conditions.filter (fun q => q.registered) := by simp [hc, hreg]
  have ha := List.any_eq_true.mpr ⟨c, hm, hv⟩
  apply Extensions.Monster.violation_precedes_missing (summarize r) he
  simp [summarize, ha]

theorem interval_iff (v lo hi : Int) :
    within (some v) (.interval lo hi) = true ↔ lo ≤ v ∧ v ≤ hi := by
  simp [within]

theorem reversed_interval_rejects (v lo hi : Int) (h : hi < lo) :
    within (some v) (.interval lo hi) = false := by
  simp [within]
  omega
end Monster
end Zoo.SourceRecords
