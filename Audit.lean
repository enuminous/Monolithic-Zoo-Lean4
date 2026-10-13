import Lean
import Ant
import Axolotl
import Bat
import Beaver
import Bison
import Bonobo
import Butterfly
import Cat
import Chameleon
import Cobra
import Core
import Crab
import Crocodile
import Dolphin
import Dragon
import Eagle
import Elephant
import Falcon
import Fox
import Gecko
import Hedgehog
import Hive
import Horse
import Jellyfish
import Lynx
import Magpie
import Mantis
import Mole
import Moth
import Octopus
import Orca
import Owl
import Penguin
import Phoenix
import Pulse
import Raven
import Registry
import Rhino
import Salmon
import Shark
import Shepherd
import Spider
import Termite
import Tortoise
import Turtle
import Weasel
import Whale
import Wolf
import Zoo

/-! Audit every safe declaration defined in the listed project modules. -/

open Lean in
run_cmd do
  let env ← getEnv
  let modules : Array Name := #[`Ant, `Axolotl, `Bat, `Beaver, `Bison, `Bonobo, `Butterfly, `Cat, `Chameleon, `Cobra, `Core, `Crab, `Crocodile, `Dolphin, `Dragon, `Eagle, `Elephant, `Falcon, `Fox, `Gecko, `Hedgehog, `Hive, `Horse, `Jellyfish, `Lynx, `Magpie, `Mantis, `Mole, `Moth, `Octopus, `Orca, `Owl, `Penguin, `Phoenix, `Pulse, `Raven, `Registry, `Rhino, `Salmon, `Shark, `Shepherd, `Spider, `Termite, `Tortoise, `Turtle, `Weasel, `Whale, `Wolf, `Zoo]
  let allowed : Array Name := #[``propext, ``Classical.choice, ``Quot.sound]
  let mut count := 0
  let mut theoremCount := 0
  for (name, info) in env.constants.toList do
    let isProject := match env.getModuleIdxFor? name with
      | some idx => modules.contains env.header.moduleNames[idx.toNat]!
      | none => (`AuditProbe).isPrefixOf (privateToUserName name)
    if isProject && !info.isUnsafe then
      count := count + 1
      if info matches .thmInfo _ then
        theoremCount := theoremCount + 1
      for ax in (← collectAxioms name) do
        unless allowed.contains ax do
          throwError "Unapproved axiom {ax} used by {name}"
  if count == 0 then
    throwError "Audit matched no project declarations"
  logInfo m!"Axiom audit passed: {count} safe declarations, {theoremCount} theorem declarations (including generated lemmas)."
