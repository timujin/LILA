extends GDScript

class_name SkillList

static func get_skill_list():
	return ["Brutality", "Acuity", "Trickery"]
	
static func get_skill_description(skill:String):
	match skill:
		"Brutality":
			return "Description of Brutality"
		"Acuity":
			return "Description of Acuity"
		"Trickery":
			return "Description of Trickery"
		_:
			return ("Skill invalid: %s" % skill)