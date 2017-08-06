using DiffEqBase, OrdinaryDiffEq, Base.Test, DiffEqDevTools, SpecialMatrices, DiffEqOperators
u0 = rand(2)
A = DiffEqArrayOperator(Strang(2))
function (p::typeof(f))(::Type{Val{:analytic}},t,u0)
    expm(p.A*t)*u0
end

prob = ODEProblem(A,u0,(0.0,1.0))

x = rand(2)
@test f(0.0,x) == A*x

sol = solve(prob,LinearImplicitEuler())

dts = 1./2.^(8:-1:4) #14->7 good plot
sim  = test_convergence(dts,prob,LinearImplicitEuler())
@test abs(sim.𝒪est[:l2]-1) < 0.2

# using Plots; pyplot(); plot(sim)

B = ones(2)
L = AffineDiffEqOperator{Float64}((A,),(B,),rand(2))
prob = ODEProblem(L,u0,(0.0,1.0))
sol = solve(prob,LinearImplicitEuler(),dt=1/10)
