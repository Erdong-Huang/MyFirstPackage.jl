using MyFirstPackage
using Test

using TropicalNumbers, LinearAlgebra, Graphs

@testset "MyFirstPackage.jl" begin
    include("shortestpath.jl")
end