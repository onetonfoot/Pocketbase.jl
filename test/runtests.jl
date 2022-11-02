using Test
using Pocketbase: generatedtypes, @generatedtypes

@testset "generatedtypes" begin
	file = joinpath(@__DIR__, "schemas/pb_schema.json")
	@test_nowarn generatedtypes(file) 
	@generatedtypes joinpath(@__DIR__, "schemas/pb_schema.json")
	@test_nowarn [Profiles, Machine, Summary]
end