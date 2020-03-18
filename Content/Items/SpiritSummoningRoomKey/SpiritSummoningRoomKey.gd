extends ItemScript

static func use(action:String, item:InventoryItem, tree):
	print("Use!>" +action + "<")
	if action == "Use":
		tree.get_root().get_node("WSHUD/Inventory").visible = false
		tree.get_root().get_node("ModeController").hold(item.icon, item.iscript, "unlock")
		
	else:
		.use(action, item, tree)
		
static func unlock(door:Node):
	var unlockable = door.get_node("Unlockable")
	if unlockable == null:
		door.blurb("This has no keyhole")
		return
	
	if unlockable.has_method("doorCode") == false:
		door.blurb("This lock isn't even real")
		return
		
	if unlockable.doorCode() != "SpiritSummoningRoomDoor":
		door.blurb("Key doesn't match")
		return
		
	door.get_node("/root/Room").\
		set_room_parameter("res://Content/Locations/FortressOfChains/SpiritSummoningRoom/SpiritSummoningRoom.gd", "door_locked", false)
	door.blurb("Door unlocked!")
	door.get_tree().get_root().get_node("ModeController").drop()
	door.get_tree().get_root().get_node("Inventory/Model").remove_item("SpiritSummoningRoomKey")
	
	