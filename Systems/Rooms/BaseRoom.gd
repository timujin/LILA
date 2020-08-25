extends Node

class_name BaseRoom

signal room_loaded

signal serialized
signal deserialized

export var roomName:String = "[ROOM NAME NOT SET]"
export var roomID:String   = "[ID NOT SET]"
export var is_scrolling    = false


func _ready():
	if not ($Serialization is Serializer):
		printerr("Serialization node must inherit Serializer")
		assert(false)
	print("connecting signals")
	$Serialization.connect("deserialized", self, "deserialized")
	$Serialization.connect("serialized", self, "serialized")
	print("conneced signals")

func serialize():
	$Serialization.serialize()
	emit_signal("serialized")
	
func deserialize():
	$Serialization.deserialize()
	emit_signal("deserialized")
	
func shade_up():
	#$AnimatedShade/Fadeout.stop(true)
	$AnimatedShade/Panel.visible = true
	
func shade_down():
	$AnimatedShade/Fadeout.play("New Anim")
	

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
