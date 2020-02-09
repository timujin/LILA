extends GDScript

class_name ItemScript

static func use(action:String, item:InventoryItem, tree):
	printerr("Action not implemented: %s for %s" % [action, item.id])