module OrdinaryDiffEqDifferentiation

import ADTypes: AutoFiniteDiff, AutoForwardDiff

import SparseDiffTools: SparseDiffTools, matrix_colors, forwarddiff_color_jacobian!,
                forwarddiff_color_jacobian, ForwardColorJacCache,
                default_chunk_size, getsize, JacVec

import ForwardDiff, FiniteDiff
import ForwardDiff.Dual
import LinearSolve

using DiffEqBase: TimeGradientWrapper,
                  UJacobianWrapper, TimeDerivativeWrapper,
                  UDerivativeWrapper

@static if isdefined(DiffEqBase, :OrdinaryDiffEqTag)
    import DiffEqBase: OrdinaryDiffEqTag
else
    struct OrdinaryDiffEqTag end
end

include("alg_utils.jl")
include("ilnsolve_utils.jl")
include("derivative_utils.jl")
include("derivative_wrappers.jl")

end
