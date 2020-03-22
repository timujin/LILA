extends ItemAction

static func run(item, script):
	WSHUD.reset()
	ModeController.hold(item, script, "unlock")
		
static func unlock(door:Node):
	var unlockable = door.get_node("Unlockable")
	if unlockable == null:
		print("BLURB")
		door.get_node("BlurbPoint").blurb("This has no keyhole")
		return
	
	if unlockable.has_method("doorCode") == false:
		door.get_node("BlurbPoint").blurb("This lock isn't even real")
		return
		
	if unlockable.doorCode() != "HappyBirthdayRoomDoor":
		print("blurb at door")
		door.get_node("BlurbPoint").blurb("Key doesn't match")
		return
		
	#door.get_node("/root/Room").\
	#	set_room_parameter("res://Content/Locations/FortressOfChains/SpiritSummoningRoom/SpiritSummoningRoom.gd", "door_locked", false)
	door.get_node("BlurbPoint").blurb("Door unlocked!")
	ModeController.drop()
	#door.get_tree().get_root().get_node("Inventory/Model").remove_item("SpiritSummoningRoomKey")
	
	