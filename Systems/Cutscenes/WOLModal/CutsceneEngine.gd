extends Node

class_name CutsceneEngine

func clear_full():
	ModeController.window.clear()

func clear_player_choices():
	ModeController.window.clear_pc()
	
func say_head(icon, text:String):
	ModeController.window.add_talking_head(icon, text)

func say_headless(text:String):
	ModeController.window.add_talking_head(null, text)

func choice_call(text, funcname):
	var response = ModeController.window.add_choice(text)
	response.connect("selected", self, funcname)
	return response
	
func add_choice_record(text:String):
	ModeController.window.add_choice_record(text)
	
func open_item_popup(filter, callback):
	ModeController.window.open_item_popup()
	ModeController.window.item_popup.set_filter(self, filter)
	ModeController.window.item_popup.connect("item_selected", self, callback)
	
func end_cutscene():
	 ModeController.stop_interaction()
