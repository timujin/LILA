extends Node

class_name BasePickler

func pickle():
	var parameters = serialize()
	Global.pickle(get_path(), parameters)

func unpickle():
	var parameters = Global.unpickle(get_path(), default_parameters())
	deserialize(parameters)
	
func repickle():
	pickle()
	unpickle()

func prepare():
	unpickle()

##########################
# THESE MUST BE OVERRIDDEN
##########################

func deserialize(params:Dictionary)->void:
	pass

func serialize()->Dictionary:
	return {}

func default_parameters()->Dictionary:
	return {}