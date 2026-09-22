import Core

namespace Zoo.Elephant


inductive Status where | active | superseded deriving Repr, DecidableEq, BEq
structure Event where
  id : Nat
  time : Nat
  status : Status
  supersedes : Option Nat
  provenance : String
  deriving Repr
/-- Source elephant.py current_events predicate over a supplied ordered history. -/
def current (events : List Event) : List Event :=
  events.filter (fun e => decide (e.status = .active))
theorem current_members_active (events : List Event) (e : Event) (h : e ∈ current events) :
    e.status = .active := by
  have hf := (List.mem_filter.mp h).2
  exact of_decide_eq_true hf
/-- Fuel makes the lineage guard total; no unbounded recursion is hidden. -/
def lineage (lookup : Nat → Option Event) : Nat → Nat → List Event
  | 0, _ => []
  | fuel+1, key => match lookup key with
    | none => []
    | some e => e :: (match e.supersedes with
      | none => []
      | some parent => lineage lookup fuel parent)
theorem zero_fuel_stops (lookup : Nat → Option Event) (key : Nat) :
    lineage lookup 0 key = [] := rfl


end Zoo.Elephant
