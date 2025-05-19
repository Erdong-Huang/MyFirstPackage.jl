using Test
using Graphs
using MyFirstPackage

@testset "shortest-path" begin
    g1 = smallgraph(:petersen)
    D1 = shortest_distance_matrix(g1)
    @test size(D1) == (nv(g1), nv(g1))
    for i in 1:nv(g1), j in 1:nv(g1)
        sp = dijkstra_shortest_paths(g1, i)
        @test D1[i, j] == sp.dists[j]
    end

    g2 = path_graph(5)
    D2 = shortest_distance_matrix(g2)
    @test D2 == [abs(i-j) for i in 1:5, j in 1:5]
end
