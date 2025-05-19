module MyFirstPackage

using Graphs
using TropicalNumbers
using LinearAlgebra

export shortest_distance_matrix

function shortest_distance_matrix(g::Graphs.AbstractGraph)
    n = nv(g)
    A = adjacency_matrix(g)           
    T = map(x -> x == 1 ? TropicalMinPlus(1) : zero(TropicalMinPlus{Int}), A)
    T .= T .+ Diagonal(fill(TropicalMinPlus(0), n))
    Tn = T^n
    dist = Array{Int}(undef, n, n)
    for i in 1:n, j in 1:n
        dist[i, j] = Int(Tn[i, j])
    end
    return dist
end

end
