using Entropia
using Test

tol = 1e-3

@testset "bandt and pompe"  begin
    x = [4, 7, 9, 10, 6, 11, 3]

    @testset "test 00" begin
        e = bandt_and_pompe(x, 2)
        @test abs(e - 0.918) <= tol
    end
    
    @testset "test 01" begin
        e = bandt_and_pompe(x, 3)
        @test abs(e - 1.522) <= tol
    end
end

@testset "bandt and pompe normal" begin
    n = 2048
    t = [i/n for i in 0:n]

    @testset "test 00" begin
        x = sin.(2π * 15 * t)
        e = bandt_and_pompe_normal(x, 6)
        @test abs(e - 0.1579) <= tol
    end
    
    @testset "test 01" begin
        x = (0.5*sin.(2π*5*t).+1) .* (sin.(2π*50*t.^2+2π*10*t))
        e = bandt_and_pompe_normal(x, 6)
        @test abs(e - 0.2625) <= tol
    end    
end

@testset "weight entropy" begin
    @testset "test 00" begin
        x = [4, 7, 9, 10, 6, 11, 3]
        e = weight_entropy(x)
        @test abs(e - 0.9801) <= tol
    end
end

@testset "complexity_entropy" begin
    @testset "test 00" begin
        x = [4, 7, 9, 10, 6, 11, 3]
        e, jsd, cjs = complexity_entropy(x)
        @test abs(e - 0.5888) <= tol
        @test abs(jsd - 0.2235) <= tol
        @test abs(cjs - 0.2900) <= tol
    end
end