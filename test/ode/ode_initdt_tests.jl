using OrdinaryDiffEq,Plots

prob = prob_ode_linear
println("Solve and Plot")
sol =solve(prob::ODEProblem,save_timeseries=true,alg=:Rosenbrock32,adaptive=true)
TEST_PLOT && plot(sol,plot_analytic=true)
Δt₀ = sol.t[2]

prob = prob_ode_2Dlinear

## Solve and plot
println("Solve and Plot")
tab = constructBogakiShampine3()
sol =solve(prob::ODEProblem,save_timeseries=true,alg=:ExplicitRK,adaptive=true,tableau=tab)
TEST_PLOT && plot(sol,plot_analytic=true)
Δt₀ = sol.t[2]

bool1 = 1e-7 < Δt₀ < .1

sol =solve(prob::ODEProblem,save_timeseries=true,alg=:Euler)
TEST_PLOT && plot(sol,plot_analytic=true)
Δt₀ = sol.t[2]

bool2 = 1e-7 < Δt₀ < .01

tab = constructDormandPrince8_64bit()
sol3 =solve(prob::ODEProblem,save_timeseries=true,alg=:ExplicitRK,adaptive=true,tableau=tab)
TEST_PLOT && plot(sol3,plot_analytic=true)
Δt₀ = sol3.t[2]

bool3 = 1e-7 < Δt₀ < .3

bool1 && bool2 && bool3
