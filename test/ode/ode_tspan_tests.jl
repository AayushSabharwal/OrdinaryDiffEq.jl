using OrdinaryDiffEq, Plots
srand(100)

prob = prob_ode_linear
sol3 =solve(prob::ODEProblem,[0,1//2,1],Δt=1//2^(6))

1//2 ∈ sol3.t
