module MyFirstPackage

using TropicalNumbers, LinearAlgebra

export shortest_path_matrix


function shortest_path_matrix(adj::AbstractMatrix{<:Real})
    n = size(adj, 1)
    tmat = map(x -> isinf(x) ? zero(TropicalMinPlus{Float64}) : TropicalMinPlus(x), adj)
    tmat += Diagonal(fill(TropicalMinPlus(0.0), n))
    tmat_power = tmat^n
    out = [tmat_power[i,j].val for i in 1:n, j in 1:n]
    return out
end

end
