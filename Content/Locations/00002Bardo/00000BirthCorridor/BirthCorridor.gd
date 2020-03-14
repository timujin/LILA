extends BaseRoom


	
### THESE MUST BE OVERLOADED IN A SUBCLASS

func get_room_name()->String:
	return "Bardo corridor"
	
func get_hud_enabled()->bool:
	return false
	
static func get_default_parameters()->Dictionary:
	return {}
	
func render()->void:
	pass