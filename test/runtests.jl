using Test
using MyFirstPackage
using Graphs

function compute_expected_shortest_path_matrix(g::SimpleGraph)
    n = nv(g)
    expected = zeros(Float64, n, n)

    for i in 1:n
        sp = dijkstra_shortest_paths(g, i)
        for j in 1:n
            expected[i, j] = sp.dists[j]
        end
    end

    return expected
end

@testset "Tropical shortest path matrix" begin
    g = SimpleGraph(5)
    add_edge!(g, 1, 2)
    add_edge!(g, 2, 3)
    add_edge!(g, 3, 4)
    add_edge!(g, 4, 5)

    M = shortest_path_matrix(g)
    expected = compute_expected_shortest_path_matrix(g)

    for i in 1:5, j in 1:5
        @test M[i, j].val ≈ expected[i, j]
    end
end
