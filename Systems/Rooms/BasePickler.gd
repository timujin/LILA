extends Node

class_name BasePickler

signal unpickled (data)

export(Dictionary) var data

func update(key:String, value):
	data[key] = value
	
func read(key:String):
	return (data[key])

func pickle():
	print("data: %s" % data)
	Character.pickles.pickle($"/root/Room".roomID, get_path(), data)

func unpickle():
	print("data: %s" % data)
	data = Character.pickles.unpickle($"/root/Room".roomID, get_path(), data)
	print("Unpickling in order")
	emit_signal("unpickled", data)
	
func repickle():
	pickle()
	unpickle()

func prepare():
	unpickle()
	
func _ready():
	add_to_group("picklers")
