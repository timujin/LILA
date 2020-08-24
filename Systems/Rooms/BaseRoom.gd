extends Node

class_name BaseRoom

signal room_loaded

export var roomName:String = "[ROOM NAME NOT SET]"
export var roomID:String   = "[ID NOT SET]"

"""
var room_loaded = false

func _ready():
	#RoomSwitcher.room = self
	get_parent().move_child(self,0)#call_deferred("move_to_back")
	call_deferred("deserialize_room")
	
var objects_to_deserialize = []
func deserialize_room():
	objects_to_deserialize = get_tree().get_nodes_in_group("serializable_room")
	if objects_to_deserialize.size() == 0:
		emit_signal("room_loaded")
		return
	for object in objects_to_deserialize:
		var data = null #Character.objects.deserialize(roomID, object.get_path(), {})
		if data.size() == 0:
			on_obj_deserialized(object)
		else:
			object.connect("deserialized", self, "on_obj_deserialized", [object])
			object.call_deferred("deserialize", data)
		
func on_obj_deserialized(object):
	objects_to_deserialize.erase(object)
	if objects_to_deserialize.size() == 0:
		emit_signal("room_loaded")
	room_loaded = true
	

"""
"""
func deserialize():
	return
	var objects = get_tree().get_nodes_in_group("serializable_room")
	for object in objects:
		var data = Character.objects.deserialize($"/root/Room".roomID, object.get_path(), {})
		if data.size() > 0:
			safe_deserialize_object(object, data)
	call_deferred("emit_signal", "room_loaded")
	
func safe_deserialize_object(object, data):
	if not self.is_inside_tree(): # room-loading safety
		call_deferred("safe_deserialize_object", object, data)
		return
	object.deserialize(data)
"""

"""
func serialize():
	var objects = get_tree().get_nodes_in_group("serializable_room")
	for object in objects:
		pass #Character.objects.serialize($"/root/Room".roomID, object.get_path(), object.serialize())

"""
