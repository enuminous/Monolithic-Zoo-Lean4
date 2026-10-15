import Lake
open Lake DSL
package «zoo46» where
  version := v!"0.2.0"
@[default_target]
lean_lib Zoo where
  roots := #[`Zoo, `Core, `Registry, `Tortoise, `Owl, `Octopus, `Gecko, `Hive, `Eagle, `Crab, `Shepherd, `Pulse, `Cat, `Fox, `Spider, `Raven, `Dolphin, `Ant, `Moth, `Shark, `Penguin, `Bat, `Hedgehog, `Crocodile, `Dragon, `Turtle, `Magpie, `Wolf, `Elephant, `Chameleon, `Jellyfish, `Beaver, `Mantis, `Bison, `Weasel, `Salmon, `Orca, `Mole, `Lynx, `Horse, `Termite, `Phoenix, `Cobra, `Whale, `Falcon, `Rhino, `Bonobo, `Axolotl, `Butterfly, `Extensions, `ExtensionFixtures, `SourceRecords]
lean_exe zoo46 where
  root := `Main
lean_exe regression where
  root := `Regression
