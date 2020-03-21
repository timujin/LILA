extends Control

class_name ClickArea

signal on_activate
signal on_apply_item


export var ActivatorName : String = "Unnamed"

func _gui_input(event):
	if ModeController.mode != ModeController.EXPLORE:
		mouse_default_cursor_shape = Control.CURSOR_ARROW
		return
	else:
		mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if not event is InputEventMouseButton:
		return
	if event.button_index != BUTTON_LEFT or not event.pressed:
		return
	if ModeController.get_is_player_holding_item():
		ModeController.apply_item(self)
		emit_signal("on_apply_item", ModeController.holding_item, ModeController.holding_callback)
	else:
		var activatable = get_node("Activatable")
		if activatable != null and activatable.has_method("activate"):
			activatable.activate()
		emit_signal("on_activate")
		

func blurb(text:String):
	InteractionBlurb.display_at_mouse(text)
		
func _ready():
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND