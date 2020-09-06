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
	
