module Pocketbase

using StructTypes, CompositeStructs
using StructTypes: @Struct

include("base_model.jl")
include("schema_field.jl")
include("schema.jl")
include("collection.jl")
include("gen.jl")

end # module Pocketbase
