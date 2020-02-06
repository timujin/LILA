extends ItemScript

func use(action:String, item:InventoryItem, tree):
	if action == "Use":
		tree.get_root().get_node("Inventory").hide()
		tree.get_root().get_node("ModeController").hold(item.icon, funcref(self, "unlock"))
		
	else:
		.use(action, item, tree)
		
func unlock(door:Node):
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
		set_room_parameter("res://Content/Locations/FortressOfChains/SpiritSummoningRoom.tscn", "door_locked", false)
	
	