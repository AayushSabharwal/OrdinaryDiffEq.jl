function initialize_backend(sym::Symbol)
  if !(sym in initialized_backends)
    println("[DifferentialEquations.jl] Initializing backend: ", sym)
    try
      init_package(sym)
    catch err
      warn("Couldn't initialize $sym.  (might need to install it?)")
      rethrow(err)
    end
    push!(initialized_backends,sym)
  end
end

type backend{T} end

init_package(sym::Symbol) = init_package(backend{sym}())
init_package(b::backend{:ODEInterface}) = @eval begin
      import ODEInterface
      export ODEInterface
      ODEInterface.loadODESolvers()
    end

init_package(b::backend{:ODEJL}) = @eval begin
      import ODE
      export ODE
    end
