extends Resource

class_name KarmaItem

export(String) var title
export(String) var description
export(Texture) var icon
export(String) var category

static func xp_curve(total_xp):
	return {
		"level": floor(total_xp / 5),
		"remain": fmod(total_xp, 5),
		"to_next": 5
	}

static func load_by_id(id:String)->KarmaItem:
	var resource:KarmaItem = load("res://Content/KarmaItems/%s/%s.tres" % [id,id])
	if resource == null:
		resource  = load("res://Content/KarmaItems/MissingNo/MissingNo.tres").duplicate(true)
		if resource == null:
			print("MissingNo karma item not set!")
			return load_by_id(id)
		resource.title = id
	return resource
	