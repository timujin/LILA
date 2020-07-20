extends Node

class_name BasePickler

signal unpickled

export(Dictionary) var data

func update(key:String, value):
	data[key] = value
	
func read(key:String):
	return (data[key])

func pickle():
	Character.pickles.pickle($"/root/Room".roomID, get_path(), data)

func unpickle():
	data = Character.pickles.unpickle($"/root/Room".roomID, get_path(), data)
	print("Unpickling in order", data)
	emit_signal("unpickled", data)
	
func repickle():
	pickle()
	unpickle()
	
func _ready():
	add_to_group("picklers")
