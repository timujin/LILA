extends BaseRoom

func get_room_name()->String:
	return "Spirit Summoning Room"
	
func get_contains_player()->bool:
	return true
	
func get_ui_enabled()->bool:
	return true
	
static func get_default_parameters()->Dictionary:
	return {
		"pentagram_on" : true,
	}
	
func get_player_spawn_point()->String:
	if get_self_parameter("pentagram_on", true) == true:
		return "DefaultSpiritSpawn"
	else:
		return "OutOfDoorSpiritSpawn"
		
################################

func render()->void:
	if get_self_parameter("pentagram_on", true):
		$Geometry.lock_pentagram()
	else:
		clear_room()
		
func clear_room():
	$Geometry.unlock_pentagram()
	$Summoner.queue_free()
	$"Door/Activator".make_accessible()
	$"Drawer/Activator".make_accessible()
		