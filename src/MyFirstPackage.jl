module MyFirstPackage

using Graphs

export shortest_distance_matrix

function shortest_distance_matrix(g::Graph)
    n = nv(g)
    dist_matrix = fill(-1, n, n)
    for i in 1:n
        sp = dijkstra_shortest_paths(g, i)
        for j in 1:n
            d = sp.dists[j]
            if !isinf(d)
                dist_matrix[i, j] = trunc(Int, d)
            end
        end
    end
    return dist_matrix
end

end
