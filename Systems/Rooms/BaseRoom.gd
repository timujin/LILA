extends Node

class_name BaseRoom

signal room_loaded

export var roomName:String = "[ROOM NAME NOT SET]"
export var roomID:String   = "[ID NOT SET]"

func _ready():
	RoomSwitcher.room = self
	call_deferred("move_to_back")
	call_deferred("unpickle")
	call_deferred("deserialize")
	call_deferred("emit_signal", "room_loaded")
	
func move_to_back():
	get_parent().move_child(self,0)


func deserialize():
	#Character.pickles.pickle("", "", {})
	var objects = get_tree().get_nodes_in_group("serializable_room")
	for object in objects:
		var data = Character.objects.deserialize($"/root/Room".roomID, get_path(), {})
		if data.size() > 0:
			object.deserialize(data)

func serialize():
	var objects = get_tree().get_nodes_in_group("serializable_room")
	for object in objects:
		Character.objects.serialize($"/root/Room".roomID, get_path(), object.serialize())
	

# pickles are obsolete; still present for history	
func unpickle():
	var picklers = get_tree().get_nodes_in_group("picklers")
	for pickler in picklers:
		pickler.unpickle()
		
func pickle():
	var picklers = get_tree().get_nodes_in_group("picklers")
	for pickler in picklers:
		pickler.pickle()


func _on_Room_room_loaded():
	pass # Replace with function body.
