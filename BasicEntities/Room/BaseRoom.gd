extends Node2D
class_name BaseRoom

signal room_loaded

export var roomName:String = "[ROOM NAME NOT SET]"
export var roomID:String   = "[ID NOT SET]"
export var defaultParameters = {}

func _ready():
	call_deferred("move_to_back")
	connect("room_loaded", RoomSwitcher, "on_room_loaded")
	RoomSwitcher.room = self
	call_deferred("emit_signal", "room_loaded")
	#call_deferred("render")
	call_deferred("unpickle")
	print("Room "+roomID+" loaded")
	
func move_to_back():
	get_parent().move_child(self,0)
	
func get_room_parameter(id:String, key:String, default):
	return RoomSwitcher.get_room_value(id, key, default)
	
func get_self_parameter(key:String, default):
	return get_room_parameter(roomID, key, default)
	
func set_room_parameter(id:String, key:String, value):
	return RoomSwitcher.set_room_value(id, key, value)
	
func set_self_parameter(key:String, value):
	return set_room_parameter(roomID, key, value)
	
func unpickle():
	var picklers = get_tree().get_nodes_in_group("picklers")
	for pickler in picklers:
		pickler.prepare()
		
func pickle():
	var picklers = get_tree().get_nodes_in_group("picklers")
	for pickler in picklers:
		pickler.pickle()
	
	
func reload_items():
	print("Reloading...")
	var picklers = get_tree().get_nodes_in_group("picklers")
	for pickler in picklers:
		pickler.unpickle()