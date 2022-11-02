using CompositeStructs

# type Collection struct {
# 	BaseModel
# 	Name       string        `db:"name" json:"name"`
# 	System     bool          `db:"system" json:"system"`
# 	Schema     schema.Schema `db:"schema" json:"schema"`
# 	ListRule   *string       `db:"listRule" json:"listRule"`
# 	ViewRule   *string       `db:"viewRule" json:"viewRule"`
# 	CreateRule *string       `db:"createRule" json:"createRule"`
# 	UpdateRule *string       `db:"updateRule" json:"updateRule"`
# 	DeleteRule *string       `db:"deleteRule" json:"deleteRule"`
# }

@composite struct Collection 
	# BaseModel...
	name::String
	system::Bool
	schema::Vector{SchemaField}
	viewRule::Union{String, Nothing}
	createRule::Union{String, Nothing}
	updateRule::Union{String, Nothing}
	deleteRule::Union{String, Nothing}
end

@Struct Collection