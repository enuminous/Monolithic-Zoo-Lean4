import Zoo

def main : IO Unit := do
  IO.println "Monolithic Zoo: 46 selected-kernel formalization modules"
  for name in Zoo.Registry.names do
    IO.println name
