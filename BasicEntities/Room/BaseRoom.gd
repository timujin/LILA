extends Node2D
class_name BaseRoom

onready var room_switcher = $"/root/RoomSwitcher"
signal room_loaded
#signal reload_items

func _ready():
	call_deferred("move_to_back")
	connect("room_loaded", room_switcher, "on_room_loaded")
	room_switcher.room = self
	call_deferred("emit_signal", "room_loaded")
	call_deferred("render")
	call_deferred("unpickle")
	print("Room "+self.get_script().get_path()+" loaded")
	
func move_to_back():
	get_parent().move_child(self,0)
	
func get_room_parameter(path:String, key:String, default):
	return room_switcher.get_room_value(path, key, default)
	
func get_self_parameter(key:String, default):
	return get_room_parameter(self.get_script().get_path(), key, default)
	
func set_room_parameter(path:String, key:String, value):
	return room_switcher.set_room_value(path, key, value)
	
func set_self_parameter(key:String, value):
	return set_room_parameter(self.get_script().get_path(), key, value)
	
func unpickle():
	var picklers = get_tree().get_nodes_in_group("picklers")
	for pickler in picklers:
		pickler.prepare()
		
func pickle():
	print("Room pickle valled")
	var picklers = get_tree().get_nodes_in_group("picklers")
	for pickler in picklers:
		pickler.pickle()
	
	
func reload_items():
	print("Reloading...")
	var picklers = get_tree().get_nodes_in_group("picklers")
	for pickler in picklers:
		pickler.unpickle()
	
	
### THESE MUST BE OVERLOADED IN A SUBCLASS

func get_room_name()->String:
	return "BASE ROOM"
	
#func get_contains_player()->bool:
#	return false
	
func get_hud_enabled()->bool:
	return true
	
static func get_default_parameters()->Dictionary:
	return {}
	
func get_player_spawn_point()->String:
	return "DefaultSpiritSpawn"
	
func render()->void:
	pass