import Core

namespace Zoo.Cobra


structure Input where
  previous : Float
  divergence : Float
  violation : Float
  proxyDelta : Float
  goalDelta : Float
  contextGap : Float
  confidence : Float
  persistence : Float := 0.8
  deriving Repr
def proxyDivergence (x : Input) : Float := pos x.proxyDelta * pos (-x.goalDelta)
def persistent (x : Input) : Float := ema x.persistence x.previous (clip01 x.divergence)
def risk (x : Input) : Float :=
  clip01 ((0.4*persistent x+0.3*clip01 x.violation+0.2*clip01 (proxyDivergence x)+
    0.1*clip01 x.contextGap)*clip01 x.confidence)
/-- Exact integer surrogate for the proxy-up / goal-down diagnostic. -/
def proxyProduct (dp dg : Int) : Int := max 0 dp * max 0 (-dg)
theorem nonimproving_proxy_zero (dp dg : Int) (h : dp ≤ 0) : proxyProduct dp dg = 0 := by
  have hz : max 0 dp = 0 := by omega
  simp [proxyProduct, hz]


end Zoo.Cobra
