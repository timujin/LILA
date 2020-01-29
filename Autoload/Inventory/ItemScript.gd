extends GDScript

class_name ItemScript

var id:String

func _init(id:String):
	self.id = id
	
func party():
	print("!!!")
	print(self.id)
	print("!!!")