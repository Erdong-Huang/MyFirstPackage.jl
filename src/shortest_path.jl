function shortest_path_matrix(g::Graphs.AbstractGraph)
    n = nv(g)
    A = adjacency_matrix(g)

    T = Matrix{TropicalMinPlus{Float64}}(undef, n, n)
    for i in 1:n, j in 1:n
        T[i, j] = A[i, j] == 0 ? TropicalMinPlus(Inf) : TropicalMinPlus(1.0)
    end

    for i in 1:n
        T[i, i] = TropicalMinPlus(0.0)
    end

    return T^n
end
