extends Area

class_name ClickableMesh

signal activated

export var ActivatorName : String = "Unnamed"
export var enabled : bool = true
export var hidden : bool = false


func on_clickable_mesh_clicked():
	pass


func _ready():
	pass
	
	#connect("mouse_entered", self, "_on_ClickableArea_mouse_entered")
	#connect("mouse_exited", self, "_on_ClickableArea_mouse_exited")
	#connect("input_event", self, "_on_ClickableArea_input_event")

func press():
	print("Clicked %s!" % ActivatorName)
	emit_signal("activated")

"""
func _on_ClickableArea_mouse_entered():
	print("hover")
	if enabled:
		ModeController.hover(self, hidden)


func _on_ClickableArea_mouse_exited():
	ModeController.unhover()


func _on_ClickableArea_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("select") and ModeController.currently_hovered == self:
		press()
"""


func _on_ClickableMesh_mouse_entered():
	print("entered")



func _on_ClickableMesh_mouse_exited():
	print("exited")
