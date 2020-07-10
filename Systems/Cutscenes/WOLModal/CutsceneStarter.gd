extends Node

var current_dialogue = null

func open(starting_node:String):
	ModeController.start_interaction()
	current_dialogue = get_node(starting_node)
	current_dialogue.execute()
