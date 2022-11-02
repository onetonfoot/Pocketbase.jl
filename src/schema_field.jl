# type SchemaField struct {
# 	System   bool   `form:"system" json:"system"`
# 	Id       string `form:"id" json:"id"`
# 	Name     string `form:"name" json:"name"`
# 	Type     string `form:"type" json:"type"`
# 	Required bool   `form:"required" json:"required"`
# 	Unique   bool   `form:"unique" json:"unique"`
# 	Options  any    `form:"options" json:"options"`
# }


# const (
# 	FieldTypeText     string = "text"
# 	FieldTypeNumber   string = "number"
# 	FieldTypeBool     string = "bool"
# 	FieldTypeEmail    string = "email"
# 	FieldTypeUrl      string = "url"
# 	FieldTypeDate     string = "date"
# 	FieldTypeSelect   string = "select"
# 	FieldTypeJson     string = "json"
# 	FieldTypeFile     string = "file"
# 	FieldTypeRelation string = "relation"
# 	FieldTypeUser     string = "user"
# )

Base.@kwdef struct SchemaField 
	system::Bool
	id::String
	name::String
	type::String
	required::Bool
	unique::Bool
	options::Any
end

@Struct SchemaField

# type TextOptions struct {
# 	Min     *int   `form:"min" json:"min"`
# 	Max     *int   `form:"max" json:"max"`
# 	Pattern string `form:"pattern" json:"pattern"`
# }
struct TextOptions
end

# type NumberOptions struct {
# 	Min *float64 `form:"min" json:"min"`
# 	Max *float64 `form:"max" json:"max"`
# }
struct NumberOptions
end

# type BoolOptions struct {
# }
struct BoolOptions
end

# type EmailOptions struct {
# 	ExceptDomains []string `form:"exceptDomains" json:"exceptDomains"`
# 	OnlyDomains   []string `form:"onlyDomains" json:"onlyDomains"`
# }
struct EmailOptions
end

# type UrlOptions struct {
# 	ExceptDomains []string `form:"exceptDomains" json:"exceptDomains"`
# 	OnlyDomains   []string `form:"onlyDomains" json:"onlyDomains"`
# }
struct UrlOptions
end

# type DateOptions struct {
# 	Min types.DateTime `form:"min" json:"min"`
# 	Max types.DateTime `form:"max" json:"max"`
# }

struct DateOptions
end


# type SelectOptions struct {
# 	MaxSelect int      `form:"maxSelect" json:"maxSelect"`
# 	Values    []string `form:"values" json:"values"`
# }
struct SelectOptions
end


# type JsonOptions struct {
# }
struct JsonOptions end

# type FileOptions struct {
# 	MaxSelect int      `form:"maxSelect" json:"maxSelect"`
# 	MaxSize   int      `form:"maxSize" json:"maxSize"` // in bytes
# 	MimeTypes []string `form:"mimeTypes" json:"mimeTypes"`
# 	Thumbs    []string `form:"thumbs" json:"thumbs"`
# }
struct FileOptions
end

# type RelationOptions struct {
# 	MaxSelect     int    `form:"maxSelect" json:"maxSelect"`
# 	CollectionId  string `form:"collectionId" json:"collectionId"`
# 	CascadeDelete bool   `form:"cascadeDelete" json:"cascadeDelete"`
# }
struct RealtionOptions
end

# type UserOptions struct {
# 	MaxSelect     int  `form:"maxSelect" json:"maxSelect"`
# 	CascadeDelete bool `form:"cascadeDelete" json:"cascadeDelete"`
# }
struct UserOptions
end