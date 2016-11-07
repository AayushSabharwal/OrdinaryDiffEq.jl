using OrdinaryDiffEq, Plots, DiffEqProblemLibrary

bools = Vector{Bool}(0)
prob = prob_ode_linear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Euler,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),save_timeseries=true,alg=:Euler,dense=true)

sol3 =solve(prob::ODEProblem,dt=1//2^(5),save_timeseries=true,alg=:Euler,dense=true)

TEST_PLOT && plot(sol2)
TEST_PLOT && plot!(float(sol2.t),interpd)
TEST_PLOT && plot!(float(sol3.t[1:2:end]),sol3.timeseries[1:2:end])

prob = prob_ode_2Dlinear
sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Euler,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),save_timeseries=true,alg=:Euler,dense=true)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < .2)

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Euler,dense=false)

push!(bools,sol(0.5) == nothing)

prob = prob_ode_linear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:RK4,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),save_timeseries=true,alg=:RK4,dense=true)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-2)

TEST_PLOT && plot(sol2)
TEST_PLOT && plot!(float(sol2.t),interpd)

sol =solve(prob::ODEProblem,save_timeseries=true,alg=:DP5,dense=true)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),save_timeseries=true,alg=:DP5,dense=true,adaptive=false)

interpd = sol(0:1//2^(4):1)
TEST_PLOT && plot(sol2.t,interpd)
TEST_PLOT && plot(sol)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-5)

prob = prob_ode_2Dlinear

sol =solve(prob::ODEProblem,save_timeseries=true,alg=:DP5,dense=true)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),save_timeseries=true,alg=:DP5,dense=true,adaptive=false)

interpd = sol(0:1//2^(4):1)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-5)

#=

prob = prob_ode_2Dlinear

sol =solve(prob::ODEProblem,save_timeseries=true,alg=:DP5Threaded,dense=true)

sol2 =solve(prob2::ODEProblem,save_timeseries=true,alg=:DP5Threaded,dense=true,adaptive=false)

interpd = sol(0:1//2^(4):1)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < .2)

const linear_bigα = parse(BigFloat,"1.01")
f = (t,u,du) -> begin
  for i in eachindex(u)
    du[i] = 1.01*u[i]
  end
end
prob_ode_bigfloatlinear = ODEProblem(f,map(BigFloat,rand(4,2)))
prob = prob_ode_bigfloatlinear

sol =solve(prob::ODEProblem,save_timeseries=true,alg=:DP5Threaded,dense=true)

sol2 =solve(prob2::ODEProblem,save_timeseries=true,alg=:DP5Threaded,dense=true,adaptive=false)

interpd = sol(0:1//2^(4):1)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < .2)

=#

prob = prob_ode_linear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:BS3,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:BS3,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-3)

prob = prob_ode_2Dlinear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:BS3,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:BS3,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-3)


prob = prob_ode_linear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Tsit5,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:Tsit5,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-5)

prob = prob_ode_2Dlinear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Tsit5,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:Tsit5,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-5)

prob = prob_ode_linear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:TanYam7,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:TanYam7,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-3)

prob = prob_ode_2Dlinear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:TanYam7,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:TanYam7,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-3)


prob = prob_ode_linear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:TsitPap8,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:TsitPap8,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-3)

prob = prob_ode_2Dlinear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:TsitPap8,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:TsitPap8,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-2)


prob = prob_ode_linear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Feagin10,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:Feagin10,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-3)

prob = prob_ode_2Dlinear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Feagin10,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:Feagin10,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-3)


### Vern6
const linear_bigα = parse(BigFloat,"1.01")
f = (t,u) -> (linear_bigα*u)
prob_ode_bigfloatlinear = ODEProblem(f,parse(BigFloat,"0.5"))
prob = prob_ode_bigfloatlinear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Vern6,dense=true)

interpd = sol(0:1//2^(7):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(7),alg=:Vern6,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-7)

#plot(sol2.t,interpd)
#plot!(sol.t,sol[:])
#scatter!(sol.t,sol[:])

prob_ode_bigfloatveclinear = ODEProblem(f,[parse(BigFloat,"0.5")])
prob = prob_ode_bigfloatveclinear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Vern6,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:Vern6,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-7)

### BS5

prob = prob_ode_linear

sol =solve(prob::ODEProblem,dt=1//2^(1),save_timeseries=true,alg=:BS5,dense=true,adaptive=false)

interpd = sol(0:1//2^(7):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(7),alg=:BS5,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 2e-7)

# plot(sol2.t,interpd)

prob = prob_ode_2Dlinear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:BS5,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:BS5,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 2e-7)

### Vern7

prob = prob_ode_linear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Vern7,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:Vern7,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 3e-9)

TEST_PLOT && plot(sol2.t,interpd)

prob = prob_ode_2Dlinear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Vern7,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:Vern7,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 5e-9)

### Vern8

prob = prob_ode_linear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Vern8,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:Vern8,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-7)

# plot(sol2.t,interpd)

prob = prob_ode_2Dlinear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Vern8,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:Vern8,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-7)

### Vern9

prob = prob_ode_linear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Vern9,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:Vern9,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-9)

# plot(sol2.t,interpd)

prob = prob_ode_2Dlinear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Vern9,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:Vern9,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 2e-9)

### Rosenbrock32

prob = prob_ode_linear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Rosenbrock32,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:Rosenbrock32,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-2)

# plot(sol2.t,interpd)

prob = prob_ode_2Dlinear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Rosenbrock32,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:Rosenbrock32,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-2)

### Trapezoid

prob = prob_ode_linear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Trapezoid,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:Trapezoid,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 1e-2)

# plot(sol2.t,interpd)

prob = prob_ode_2Dlinear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:Trapezoid,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:Trapezoid,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 2e-2)

### DP8

prob = prob_ode_linear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:DP8,dense=true)

interpd = sol(0:1//2^(7):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(7),alg=:DP8,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 2e-7)

#=
plot(sol2.t,interpd)
plot!(sol2)
scatter!(sol.t,sol[:])
=#

prob = prob_ode_2Dlinear

sol =solve(prob::ODEProblem,dt=1//2^(2),save_timeseries=true,alg=:DP8,dense=true)

interpd = sol(0:1//2^(4):1)

sol2 =solve(prob::ODEProblem,dt=1//2^(4),alg=:DP8,dense=true,adaptive=false)

push!(bools,maximum(map((x)->maximum(abs(x)),sol2[:] - interpd)) < 2.01e-7)

println(bools)
minimum(bools)
