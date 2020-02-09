extends BaseRoom

func get_room_name()->String:
	return "Corridor"
	
func get_contains_player()->bool:
	return true
	
static func get_default_parameters()->Dictionary:
	return {}
	
func get_player_spawn_point()->String:
	return "DefaultSpiritSpawn"