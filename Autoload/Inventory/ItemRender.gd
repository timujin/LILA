class_name ItemRender

var resource:InventoryItem 
var icon    :Texture
var iscript  :ItemScript
var iid     :String

const defaultIcon = preload("res://Autoload/Inventory/DefaultIcon.png")
const defaultScript = preload("res://Autoload/Inventory/ItemScript.gd")
const errorItem = "MissingNo"

func _init(id:String):
	print("Loading..."+id)
	resource = load("res://Autoload/Inventory/Items/%s/%s.tres" % [id,id])
	icon = load("res://Autoload/Inventory/Items/%s/%s.png"  % [id,id])
	iscript = load("res://Autoload/Inventory/Items/%s/%s.gd"   % [id,id])
	if resource == null:
		resource = load("res://Autoload/Inventory/Items/%s/%s.tres" % [errorItem,errorItem]).duplicate(true)
		resource.name = id
		resource.long_description = "Item not found: " + id
		icon = load("res://Autoload/Inventory/Items/%s/%s.png"  % [errorItem,errorItem])
		iscript = load("res://Autoload/Inventory/Items/%s/%s.gd"   % [errorItem,errorItem])
		#id = errorItem
		print("Loading:")
		print(resource.long_description)
	if icon == null:
		icon = defaultIcon
	if iscript == null:
		iscript = defaultScript
	iscript = iscript.new(id)
	
		
func pr():
	print(resource)
	print(icon)
	print(iscript)
	print(resource.long_description)
	iscript.party()
