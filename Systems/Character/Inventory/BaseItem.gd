extends Node

class_name BaseItem

export(String) var display_name = "" setget , get_display_name
export(Texture)var icon = preload("res://Systems/Character/Inventory/Assets/ios-application-placeholder.png")
export(String) var description = "", setget , get_description
export(String) var category = "Miscellaneous"
export(bool)   var countable = true

func get_display_name():
	if display_name == "":
		return self.name # Node name aka ID
	else:
		return display_name

func get_description():
	if description == "":
		return "(no description)"
	else:
		return description
		
static func load_by_id(id:String):
	var res = GlobalRegister.item(id)
	if res == null:
		res = GlobalRegister.item("MissingNo")
	return res
