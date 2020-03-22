extends ItemAction

static func run():
	print("RUN INSIDE")
	"""
	var VN
	#tree.get_root().get_node("/root/WSHUD/Inventory").hide()
	printerr("TODO: hide inventory")
	ModeController.is_world_scrollable = false
	VN = preload("res://Content/Rooms/00000Bardo/00001HappyBirthday/VNReadNote.tscn").instance()
	RoomSwitcher.get_tree().get_root().get_node("/root/Room").add_child(VN)
	yield(VN.run(), "completed")
	VN.queue_free()
	ModeController.is_world_scrollable = tru
	"""