extends BaseRoom


	
### THESE MUST BE OVERLOADED IN A SUBCLASS

static func get_room_name()->String:
	return "Corridor?"
	
static func get_id()->String:
	return "00000BirthCorridor"
	
static func get_default_parameters()->Dictionary:
	return {}
	