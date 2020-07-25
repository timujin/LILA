extends Node

# Status: works; but not feature-complete

class_name BaseItem

signal item_updated (item)

export(String) var id = "" # intended to uniquely point to an item's species
export(String) var display_name = "" setget , get_display_name
export(Texture)var icon = \
	preload("res://Systems/Character/Inventory/Assets/ios-application-placeholder.png")\
	setget, get_icon
export(String) var description = "" setget , get_description
export(String) var category = "Miscellaneous"
export(bool)   var countable = true
export(bool)   var usable_in_dialogues = true
export(Array) var tags = []
export(bool) var hidden = false setget , get_hidden


# Runtime properties to be serialized

var count:int = 0 
export(Dictionary) var payload = {}
var notification_up:bool = false setget , get_notification_up

# Override those getters for items with dynamic presentations

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
		
func get_icon():
	return icon
	
func get_hidden():
	return hidden
	
func get_notification_up():
	return notification_up

func add_count(number:int):
	assert(number >= 0)
	assert(self.countable)
	self.count += number
	emit_signal("item_updated", self)
	
func remove_count(number:int, cleanup=true):
	assert(number >= 0)
	assert(self.countable)
	self.count -= number
	if cleanup and self.count == 0:
		selfdestruct()
	emit_signal("item_updated", self)
	
func is_enough(number:int):
	assert(number >= 0)
	assert(self.countable)
	return self.count >= number
	
		
func selfdestruct():
	queue_free()

func notify():
	notification_up = true
		
static func load_by_id(id:String)->BaseItem:
	print("ID: %s" % id)
	var res = GlobalRegister.item(id)
	print("Result: %s" % res)
	if res == null:
		res = GlobalRegister.item("MissingNo")
	return res
