extends Resource

class_name Combatcard

export(String) var id
export(String) var title
export(Texture) var icon
export(String) var description
export(String, MULTILINE) var long_description

export(GDScript) var effect
export(Resource) var price
	
static func load_by_id(id:String):
	var res = GlobalRegister.combatcard(id)
	if res == null:
		res = GlobalRegister.item("MissingNo")
	return res