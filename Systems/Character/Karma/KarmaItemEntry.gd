extends Resource

class_name KarmaItemEntry

export(Resource) var species
export(int) var level
export(int) var xp

func _init(id):
	var item = KarmaItem.load_by_id(id)
	self.species = item
	self.level = 0
	self.xp    = 0
	
func is_id(id:String):
	return id.to_lower() == species.id.to_lower()
	
func add_xp(amount:int):
	#var animation = {
	#	"start": {"lv":level,"xp":xp},
	#	"end": null
	#}
	xp += amount
	while xp > species.curve(level):
		xp -= species.curve(level)
		level += 1
	#animation["end"] = {"lv":level,"xp":xp}
	#emit_signal("xp_gained", amount)
	#if level > animation["start"]["lv"]:
	#	emit_signal("lvl_up", level - animation["start"]["lv"])
	#return animation
	
func reset_xp():
	xp = 0
	
func add_levels(amount:int):
	#var animation = {
	#	"start": {"lv":level,"xp":xp},
	#	"end": {"lv":level+amount,"xp":xp}
	#}
	level += amount
	#return animation
	
func bring_up_to_level(amount:int):
	#if level >= amount:
	#	return  {
	#		"start": {"lv":level,"xp":xp},
	#		"end": {"lv":level,"xp":xp}
	#	}
	#else:
	#	var animation = {
	#		"start": {"lv":level,"xp":xp},
	#		"end": {"lv":amount,"xp":0}
	#	}
	level = amount
	#	return animation
		
func drain_levels(amount:int):
	if amount > level:
		var animation = {
			"start": {"lv":level,"xp":xp},
			"end": {"lv":0,"xp":0},
			"erase": true
		}
		level = 0
		xp = 0
		return animation
	else:
		var animation = {
			"start": {"lv":level,"xp":xp},
			"end": {"lv":level-amount,"xp":xp},
			"erase": true
		}
		level -= amount
		return animation
		
func is_enough_levels(amount:int):
	return level >= amount