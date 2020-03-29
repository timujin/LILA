extends Resource

class_name KarmaItem

export(String) var id
export(String) var title
export(String) var description
export(Texture) var icon
export(String) var category
export(String, "Linear", "FL") var xp_curve = "FL"

export(Dictionary) var actions = {} # Level#name -> activation script
export(Array) var combat_cards = []
export(Dictionary) var other_data = {} # String -> anything


func curve(current_level):
	if xp_curve == "Linear":
		return curve_linear(current_level)
	if xp_curve == "FL":
		return curve_fallenlondon(current_level)

static func curve_linear(current_level):
	return 5
	
static func curve_fallenlondon(current_level):
	return current_level



"""
static func load_by_id(id:String)->KarmaItem:
	var resource:KarmaItem = load("res://Content/KarmaItems/%s/%s.tres" % [id,id])
	if resource == null:
		resource  = load("res://Content/KarmaItems/MissingNo/MissingNo.tres").duplicate(true)
		if resource == null:
			print("MissingNo karma item not set!")
			return load_by_id(id)
		resource.title = id
	return resource
"""