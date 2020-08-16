using Units
using Test

@testset "conversions" begin
    @test Foot(1) == 1ft
    @test NauticalMile(1)/hr == 1kt
end

@testset "methods" begin
    sim(x::Foot, y::Foot) = x^2 + y^2
    @test sim(1ft, 2ft) == 5ft^2
    @test sim(1.0ft, 2.0ft) == 5.0ft^2
    @test_throws MethodError sim(1m, 1m)
end