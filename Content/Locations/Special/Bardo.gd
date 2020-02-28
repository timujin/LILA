extends BaseRoom

func get_room_name()->String:
	return "Bardo"
	
func get_contains_player()->bool:
	return false
	
func get_ui_enabled()->bool:
	return false
	
static func get_default_parameters()->Dictionary:
	return {
		"start_of_the_game": true
	}
	
func get_player_spawn_point()->String:
	return "DefaultSpiritSpawn"
		
################################

func render()->void:
	pass
		
		
		
		
		
		
		
