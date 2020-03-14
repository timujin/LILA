extends ItemScript

static func use(action:String, item:InventoryItem, tree):
	var VN
	if action == "Read":
		tree.get_root().get_node("/root/Inventory").hide()
		tree.get_root().get_node("/root/ModeController").is_world_scrollable = false
		VN = preload("res://Content/Locations/00002Bardo/00001HappyBirthday/VNReadNote.tscn").instance()
		#VN.connect("show_door", self, "show_door")
		#VN.connect("finished" , self, "dialogue_finished")
		tree.get_root().get_node("/root/Room").add_child(VN)
		yield(VN.run(), "completed")
		VN.queue_free()
		tree.get_root().get_node("/root/ModeController").is_world_scrollable = true
	else:
		printerr("Action not implemented: %s for %s" % [action, item.id])