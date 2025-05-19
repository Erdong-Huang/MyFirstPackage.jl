using MyFirstPackage, Test

@testset "shortest_path_matrix" begin
    adj = [0.0 1.0 Inf;
           Inf 0.0 2.0;
           4.0 Inf 0.0]
    expected = [0.0 1.0 3.0;
                6.0 0.0 2.0;
                4.0 5.0 0.0]
    result = shortest_path_matrix(adj)
    @test all(abs.(result .- expected) .< 1e-6)
end
