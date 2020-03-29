extends Resource

class_name Item_td

export(String) var id
export(String) var title
export(Texture) var icon
export(String) var description
export(String, MULTILINE) var long_description
export(String, MULTILINE) var hint
export(String) var category
export(bool)   var countable

export(Array) var test_array

export(Dictionary) var actions = {} # Human-readable name -> activation script
export(Dictionary) var other_data = {} # String -> anything

export(String, "Equipment", "Consumable", "Tool", "Misc") var type = "Misc"
export(String, \
	"None", "Head", "Chest", "Main", "Off", "Gloves",\
	"Lapel", "Pants", "Shoes", "Ring", "Amulet", "Accessory")\
	 var equipment_slot = "None"

"""
static func load_by_id(id:String)->InventoryItem:
	var resource:InventoryItem = load("res://Content/Items/%s/%s.tres" % [id,id])
	if resource == null:
		resource  = load("res://Content/Items/MissingNo/MissingNo.tres").duplicate(true)
		if resource == null:
			print("MissingNo item not set!")
			return load_by_id(id)
		resource.name = id
	return resource
"""