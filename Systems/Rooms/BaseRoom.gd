extends Node

class_name BaseRoom

signal room_loaded

export var roomName:String = "[ROOM NAME NOT SET]"
export var roomID:String   = "[ID NOT SET]"

func _ready():
	RoomSwitcher.room = self
	call_deferred("move_to_back")
	call_deferred("unpickle")
	call_deferred("emit_signal", "room_loaded")
	
func move_to_back():
	get_parent().move_child(self,0)
	
func unpickle():
	var picklers = get_tree().get_nodes_in_group("picklers")
	for pickler in picklers:
		pickler.unpickle()
		
func pickle():
	var picklers = get_tree().get_nodes_in_group("picklers")
	for pickler in picklers:
		pickler.pickle()
