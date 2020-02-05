extends Node

class_name Activator

signal activated

onready var clickarea = get_parent().get_node("ClickArea")
onready var blurbpoint = $"../BlurbPoint"

func activate():
	if clickarea != null:
		print("Activated %s!" % clickarea.ActivatorName)
	else:
		printerr("Activation area not set!")
	emit_signal("activated")
	
	if $"/root/ModeController".get_is_player_holding_item():
		apply_item($"/root/ModeController".holding_callback)
	else:
		if has_method("on_activate"):
			self.call("on_activate")
		
func apply_item(callback):
	callback.call_func(self)
		
func blurb(text:String):
	if blurbpoint == null:
		printerr("No blurb point set!")
	else:
		$"/root/InteractionBlurb".display(text, blurbpoint)