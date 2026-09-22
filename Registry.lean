import Core

namespace Zoo.Registry

inductive Animal where
  | tortoise
  | owl
  | octopus
  | gecko
  | hive
  | eagle
  | crab
  | shepherd
  | pulse
  | cat
  | fox
  | spider
  | raven
  | dolphin
  | ant
  | moth
  | shark
  | penguin
  | bat
  | hedgehog
  | crocodile
  | dragon
  | turtle
  | magpie
  | wolf
  | elephant
  | chameleon
  | jellyfish
  | beaver
  | mantis
  | bison
  | weasel
  | salmon
  | orca
  | mole
  | lynx
  | horse
  | termite
  | phoenix
  | cobra
  | whale
  | falcon
  | rhino
  | bonobo
  | axolotl
  | butterfly
  deriving Repr, DecidableEq, BEq

def all : List Animal := [.tortoise, .owl, .octopus, .gecko, .hive, .eagle, .crab, .shepherd, .pulse, .cat, .fox, .spider, .raven, .dolphin, .ant, .moth, .shark, .penguin, .bat, .hedgehog, .crocodile, .dragon, .turtle, .magpie, .wolf, .elephant, .chameleon, .jellyfish, .beaver, .mantis, .bison, .weasel, .salmon, .orca, .mole, .lynx, .horse, .termite, .phoenix, .cobra, .whale, .falcon, .rhino, .bonobo, .axolotl, .butterfly]

def names : List String := ["TORTOISE", "OWL", "OCTOPUS", "GECKO", "HIVE", "EAGLE", "CRAB", "SHEPHERD", "PULSE", "CAT", "FOX", "SPIDER", "RAVEN", "DOLPHIN", "ANT", "MOTH", "SHARK", "PENGUIN", "BAT", "HEDGEHOG", "CROCODILE", "DRAGON", "TURTLE", "MAGPIE", "WOLF", "ELEPHANT", "CHAMELEON", "JELLYFISH", "BEAVER", "MANTIS", "BISON", "WEASEL", "SALMON", "ORCA", "MOLE", "LYNX", "HORSE", "TERMITE", "PHOENIX", "COBRA", "WHALE", "FALCON", "RHINO", "BONOBO", "AXOLOTL", "BUTTERFLY"]

theorem exactly_forty_six : all.length = 46 := by decide
theorem no_duplicate_animals : all.Nodup := by decide
theorem names_match_count : names.length = all.length := by decide

end Zoo.Registry
