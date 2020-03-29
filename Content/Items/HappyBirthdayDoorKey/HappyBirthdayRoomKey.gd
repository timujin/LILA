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
		
	if unlockable.has_method("unlock") == false:
		door.get_node("BlurbPoint").blurb("ERROR: no 'unlock' method provided!")
		return
		
	unlockable.unlock()		
	door.get_node("BlurbPoint").blurb("Door unlocked!")
	ModeController.drop_held_item()
	CharacterData.inventory.remove_item("HappyBirthdayDoorKey", -1)