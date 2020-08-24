extends Area2D

class_name ClickableArea

signal activated

export var ActivatorName : String = "Unnamed"
export var enabled : bool = true
export var hidden : bool = false


"""
func blurb(text:String):
	if $"../BlurbPoint" == null:
		printerr("No blurb point set!")
	else:
		$"../BlurbPoint".blurb(text)
"""

func _ready():
	connect("mouse_entered", self, "_on_ClickableArea_mouse_entered")
	connect("mouse_exited", self, "_on_ClickableArea_mouse_exited")
	connect("input_event", self, "_on_ClickableArea_input_event")

func press():
	print("Clicked %s!" % ActivatorName)
	emit_signal("on_activate")
	var activatable = get_parent().get_node("Activator")
	if activatable != null and activatable.has_method("activate"):
		activatable.activate()
	if activatable != null and activatable.has_method("on_activate"):
		activatable.on_activate()


func _on_ClickableArea_mouse_entered():
	print("hover")
	if enabled:
		ModeController.hover(self, hidden)


func _on_ClickableArea_mouse_exited():
	ModeController.unhover()


func _on_ClickableArea_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("select") and ModeController.currently_hovered == self:
		press()

