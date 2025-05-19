using Graphs

function shortest_distance_matrix(g::Graph)
    n = nv(g)
    dist_matrix = zeros(Int, n, n)
    for i in 1:n
        sp = dijkstra_shortest_paths(g, i)
        for j in 1:n
            dist_matrix[i, j] = sp.dists[j] == Inf ? -1 : Int(sp.dists[j])
        end
    end
    return dist_matrix
end
