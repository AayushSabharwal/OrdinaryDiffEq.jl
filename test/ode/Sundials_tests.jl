using OrdinaryDiffEq

prob = prob_ode_linear
Δt = 1//2^(4)
tspan = [0;1]
@time sol =solve(prob::ODEProblem,tspan,Δt=Δt,save_timeseries=true,alg=:cvode_BDF)
@time sol =solve(prob::ODEProblem,tspan,Δt=Δt,save_timeseries=true,alg=:cvode_Adams)
@time sol =solve(prob::ODEProblem,tspan,Δt=Δt,save_timeseries=true,alg=:cvode_Adams,adaptive=false)

prob = prob_ode_2Dlinear
@time sol =solve(prob::ODEProblem,tspan,Δt=Δt,save_timeseries=true,alg=:cvode_BDF)
@time sol =solve(prob::ODEProblem,tspan,Δt=Δt,save_timeseries=true,alg=:cvode_Adams)
@time sol =solve(prob::ODEProblem,tspan,Δt=Δt,save_timeseries=true,alg=:cvode_Adams,adaptive=false)

length(sol)==17
