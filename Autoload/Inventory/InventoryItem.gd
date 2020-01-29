extends Resource

class_name InventoryItem

#export(String) var id
export(String) var name
export(String) var description
export(String, MULTILINE) var long_description
export(String, MULTILINE) var hint
export(String, MULTILINE) var actions

export(String, "Equipment", "Consumable", "Misc") var type
export(String, \
	"None", "Head", "Chest", "Main", "Off", "Gloves", "Lapel", "Pants", "Shoes", "Ring", "Amulet", "Charm")\
	 var equipment_slot

export(String) var category # TODO: make inventory sort by this
export(bool)   var countable
