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
			return  "Precision and power. Clarity of purpose. "+\
					"Acuity is your ability to keep the eye on the ball. "+\
					"Your mind is a blade, and a sharper blade cuts deeper. "+\
					"Life is an exact science, so be an exact person."
		"Alchemy":
			return "Nothing is permanent. Everything decays. Changes. "+\
				   "Stops being one thing and starts being something else. "+\
				   "Even the universe itself. Even you. This is essential to understand and accept. "+\
				   "And then — master. Alchemy is your ability to notice, endure, and produce change."
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