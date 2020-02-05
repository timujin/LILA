extends GDScript

class_name ItemScript

var id:String
var icon:Texture

func _init(id:String, icon:Texture=null):
	self.id = id
	if icon == null:
		self.icon = preload("res://Autoload/Inventory/DefaultIcon.png")
	else:
		self.icon = icon
	
func party():
	print("!!!")
	print(self.id)
	print("!!!")
	
func use(action:String, tree):
	printerr("No action " + action + " for item " + id)