using JSON3, URIs
using StringCases: pascalcase

const str_to_type::Dict{String, Type} =  Dict(
	"text" =>  String,
	"number" => Float64,
	"bool" => Bool,
	"email" => String,
	"url" =>  URI,
	"date" => DateTime,
	"select" => String,
	"json" =>  Dict,
	"file" => String,
	"relation" => String,
)

function collection_to_struct(c::Collection)

	name = Symbol(pascalcase(c.name))

	fields =  [ Expr(:(::), Symbol(field.name), get(str_to_type, field.type, Any)) for field in c.schema]
	fields = map(c.schema) do field 
		T = get(str_to_type, field.type, Any)

		if !field.required
			T = Union{T, Nothing}
		end

		 Expr(:(::), Symbol(field.name), T) 
	end


	expr = Expr(:struct, false, name, Expr(:block,
		fields...
	))

	return expr
end


# String, Dict, Vectors
# Files, String

function generatedtypes(d::AbstractDict)
	c = StructTypes.constructfrom(Collection, d)
	collection_to_struct(c)
end

function generatedtypes(s::Union{AbstractString, AbstractVector{UInt8}})
	if isfile(s) 
		s = read(s)
	end

	c= try
		JSON3.read(s, Collection)
	catch
		JSON3.read(s, Vector{Collection})
	end
	generatedtypes(c)
end


generatedtypes(c::Collection) = collection_to_struct(c)

function generatedtypes(l::Array{Collection})
	expr = Expr(:block)
	expr.args = map(generatedtypes, l)
	expr
end

macro generatedtypes(s)
	esc(generatedtypes(eval(s)))
end