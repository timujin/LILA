extends GDScript

class_name SkillRules

static func skill_names():
	return [
		"Acuity",
		"Alchemy",
		"Attainment",
		"Audacity",
		"Awareness",
		"Brutality",
		"Catma",
		"Charisma",
		"Curiosity",
		"Determination",
		"Dogma",
		"Exploration",
		"Imagination",
		"Insight",
		"Life",
		"Lore",
		"Love",
		"Luck",
		"Rationality",
		"Resourcefulness",
		"Time",
		"Trickery",
		"Vitality"
	]

static func skill_description(skill:String)->String:
	match skill:
		"Acuity":
			return \
			"""
			Precision and power. Clarity of purpose. Acuity is your ability to keep the eye on the ball, to do exactly what needs to be done, no more, no less. Life is a dance. With every step, your foot must come down at precisely the right spot at precisely the right time. With high Acuity, your every move, every glance, every twitch of the finger is exact and calculated. With low Acuity, you will fumble, stumble, stutter, break glass, lose face. Some people find it cute, until somebody loses an eye.

			Applications: fine motor skills, manual operation, ranged weapons
			"""
		"Alchemy":
			return \
			"""
			Precision and power. Clarity of purpose. Acuity is your ability to keep the eye on the ball, to do exactly what needs to be done, no more, no less. Life is a dance. With every step, your foot must come down at precisely the right spot at precisely the right time. With high Acuity, your every move, every glance, every twitch of the finger is exact and calculated. With low Acuity, you will fumble, stumble, stutter, break glass, lose face. Some people find it cute, until somebody loses an eye.

			Applications: fine motor skills, manual operation, ranged weapons
			"""
		"Attainment":
			return "[DESCRIPTION OF ATTAINMENT NIY]"
		"Audacity":
			return "Asking for permission is for lesser beings. You only ask for forgiveness. "+\
				   "[FULL DESCRIPTION OF AUDACITY NIY]"
		"Awareness":
			return "The world is there, whether you want it or not. Learn to be present in it. "+\
				   "Learn to see, to notice. Knowing where and when things are."
		"Brutality":
			return "[DESCRIPTION NIY]"
		"Catma":
			return "[DESCRIPTION NIY]"
		"Charisma":
			return "[DESCRIPTION NIY]"
		"Curiosity":
			return "[DESCRIPTION NIY]"
		"Determination":
			return "[DESCRIPTION NIY]"
		"Dogma":
			return "[DESCRIPTION NIY]"
		"Exploration":
			return "[DESCRIPTION NIY]"
		"Imagination":
			return "[DESCRIPTION NIY]"
		"Insight":
			return "[DESCRIPTION NIY]"
		"Life":
			return "[DESCRIPTION NIY]"
		"Lore":
			return "[DESCRIPTION NIY]"
		"Love":
			return "[DESCRIPTION NIY]"
		"Luck":
			return "[DESCRIPTION NIY]"
		"Rationality":
			return "[DESCRIPTION NIY]"
		"Resourcefulness":
			return "[DESCRIPTION NIY]"
		"Time":
			return "[DESCRIPTION NIY]"
		"Trickery":
			return "[DESCRIPTION NIY]"
		"Vitality":
			return "[DESCRIPTION NIY]"
		var x:
			printerr("ERROR: Skill not found: %s" % x)
			return "ERROR: Skill not found: %s" % x
			
static func skill_icon(skill:String)->Texture:
	return preload("res://Assets/Placeholders/adeptmastersorc.png")
	
static func default_skills()->Dictionary:
	var res = {}
	for key in skill_names():
		res[key] = 0
	return res