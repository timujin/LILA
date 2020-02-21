extends Node

class_name BasePickler

onready var global = $"/root/Global"

func pickle():
	var parameters = serialize()
	global.pickle(get_path(), parameters)

func unpickle():
	var parameters = global.unpickle(get_path(), default_parameters())
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
	assert(false)

func serialize()->Dictionary:
	assert(false)
	return {}

func default_parameters()->Dictionary:
	assert(false)
	return {}