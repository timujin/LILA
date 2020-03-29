extends Node

func apply_to_enemy(combat, enemy):
	var damageable = enemy.get_node("Damageable")
	if damageable == 0:
		combat.announce("This seems to be invulnerable")
	if damageable.has_method("damage"):
		damageable.damage(10)