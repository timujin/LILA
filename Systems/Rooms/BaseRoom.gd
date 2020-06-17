extends Node2D

class_name BaseRoom

signal room_loaded

export var roomName:String = "[ROOM NAME NOT SET]"
export var roomID:String   = "[ID NOT SET]"

func _ready():
	call_deferred("move_to_back")
	#connect("room_loaded", RoomSwitcher, "on_room_loaded")
	RoomSwitcher.room = self
	call_deferred("emit_signal", "room_loaded")
	call_deferred("unpickle")
	
func move_to_back():
	get_parent().move_child(self,0)
	
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
		
	
