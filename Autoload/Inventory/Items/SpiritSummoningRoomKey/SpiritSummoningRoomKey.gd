extends "res://Autoload/Inventory/ItemScript.gd"

func _init(id:String, icon:Texture).(id,icon):
   pass

func use(action:String, tree):
	if action == "Use":
		tree.get_root().get_node("Inventory").hide()
		tree.get_root().get_node("ModeController").hold(icon, funcref(self, "unlock"))
		
	else:
		.use(action, tree)
		
func unlock(door:Node):
	var unlockable = door.get_node("Unlockable")
	if unlockable == null:
		door.blurb("This is not unlockable")
		return
	
	if unlockable.has_method("doorCode") == false:
		door.blurb("No key matches this lock")
		return
		
	if unlockable.doorCode() != "SpiritSummoningRoomDoor":
		door.blurb("Key doesn't match")
		return
		
	door.get_node("/root/Room").set_self_parameter("door_locked", false)
	
	