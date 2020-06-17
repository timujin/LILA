extends Resource

class_name Item

export(String) var id
export(String) var title
export(Texture) var icon
export(String) var description
export(String, MULTILINE) var long_description
export(String, MULTILINE) var hint
export(String) var category
export(bool)   var countable

export(Dictionary) var actions = {} # Human-readable name -> activation script
export(Array) var combat_cards = []
export(Dictionary) var other_data = {} # String -> anything

export(String, \
	"None", "Right hand", "Left hand", "Head", "Body", "Ring", "Amulet")\
	 var equipment_slot = "None"
	
static func load_by_id(id:String):
	var res = GlobalRegister.item(id)
	if res == null:
		res = GlobalRegister.item("MissingNo")
	return res
