extends Activator

func on_activate():
	get_parent().queue_free()
	var popped = Sprite.new()
	get_parent().get_parent().add_child(popped)
	popped.global_position = get_parent().get_node("Sprite").global_position
	popped.texture = load("res://Content/Rooms/00000Bardo/00001HappyBirthday/Graphics/Balloons/Pop.png")
	popped.scale = Vector2(0.5, 0.5)
	var timer = get_tree().create_timer(0.15)
	timer.connect("timeout",popped,"queue_free") 