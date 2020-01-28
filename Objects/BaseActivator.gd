extends Node

class_name Activator

signal activated

onready var clickarea = get_parent().get_node("ClickArea")

func activate():
	if clickarea != null:
		print("Activated %s!" % clickarea.ActivatorName)
	else:
		printerr("Activation area not set!")
	emit_signal("activated")
	
	if has_method("on_activate"):
		self.call("on_activate")
		
func blurb(text:String):
	$"/root/InteractionBlurb".display(text, $"../BlurbPoint")