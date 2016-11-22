# This definitely needs cleaning
using OrdinaryDiffEq, DiffEqDevTools, DiffEqBase
probArr = Vector{ODETestProblem}(2)
probArr[1] = prob_ode_linear

probArr[2] = prob_ode_2Dlinear
srand(100)
## Convergence Testing
println("Convergence Test on Linear")
dts = 1.//2.^(8:-1:4)
testTol = 0.2
superduperbool = Vector{Bool}(2)

for i = 1:2
  prob = probArr[i]
  println("Special RKs")
  sim = test_convergence(dts,prob,Euler())
  @test abs(sim.𝒪est[:final]-1) < testTol
  sim2 = test_convergence(dts,prob,Midpoint())
  @test abs(sim2.𝒪est[:l∞]-2) < testTol
  sim3 = test_convergence(dts,prob,RK4())
  @test abs(sim3.𝒪est[:l∞]-4) < testTol
  sim4 = test_convergence(dts,prob,BS3())
  @test abs(sim3.𝒪est[:l2]-4) < testTol
  
  ### Stiff Solvers

  println("Convergence Test on Stiff")
  dts = 1.//2.^(8:-1:4)

  sim12 = test_convergence(dts,prob,ImplicitEuler(),autodiff=true)
  sim122 = test_convergence(dts,prob,ImplicitEuler(),autodiff=false)
  @test (abs(sim12.𝒪est[:final]-1) < testTol) && (abs(sim122.𝒪est[:final]-1) < testTol)
  sim13 = test_convergence(dts,prob,Trapezoid(),autodiff=true)
  sim132 = test_convergence(dts,prob,Trapezoid(),autodiff=false)
  @test (abs(sim13.𝒪est[:final]-2) < testTol) && (abs(sim132.𝒪est[:final]-2) < testTol)
end
