extends Resource

class_name InventoryItem

export(String) var id
export(Texture) var icon
export(GDScript) var iscript
export(String) var name
export(String) var description
export(String, MULTILINE) var long_description
export(String, MULTILINE) var hint
export(String, MULTILINE) var actions

export(String, "Equipment", "Consumable", "Tool", "Misc") var type
export(String, \
	"None", "Head", "Chest", "Main", "Off", "Gloves", "Lapel", "Pants", "Shoes", "Ring", "Amulet", "Accessory")\
	 var equipment_slot

export(String) var category
export(bool)   var countable

static func load_by_id(id:String)->InventoryItem:
	var resource:InventoryItem = load("res://Content/Items/%s/%s.tres" % [id,id])
	if resource == null:
		resource  = load("res://Content/Items/MissingNo/MissingNo.tres").duplicate(true)
		if resource == null:
			print("MissingNo item not set!")
			return load_by_id(id)
		resource.name = id
	return resource
	