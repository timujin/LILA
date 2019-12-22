extends PathFollow2D

signal launched
signal whiffed
signal expired
signal activated

enum State { DORMANT, TICKING, ACTIVATING, WHIFFING, EXPIRING }
var state:int = State.DORMANT

onready var parent = get_parent()
var speed = 300 # pixels per second

func _process(delta):
	if state == State.TICKING:
		offset += speed*delta
		if unit_offset >= 1:
			expire()

func spawn():
	visible = false
	$Base.visible = false
	$BlackBorder.visible = false
	$HugCircle.queue_free()
	$WhiffCloud.visible = false
	$Success.visible = false
	state = State.DORMANT
	
	#path_follow = PathFollow2D.new()
	#parent.add_child(path_follow)
	#path_follow.add_child(self)
	
	loop = false
	rotate = false
	offset = 0.0

func reveal():
	visible = true
	$Base.visible = true
	$BlackBorder.visible = true
	$HugCircle.visible = false
	$WhiffCloud.visible = false
	$Success.visible = false
	state = State.DORMANT
	
func launch(duration:float = 1.0):
	emit_signal("launched")
	state = State.TICKING
	
func activate():
	emit_signal("activated")
	state = State.ACTIVATING
	$Base.visible = false
	$BlackBorder.visible = false
	$Success.visible = true
	$Success/AnimationPlayer.play("Splash")
	yield($Success/AnimationPlayer, "animation_finished")
	destroy()
	
func whiff():
	emit_signal("whiffed")
	state = State.WHIFFING
	$Base.visible = false
	$BlackBorder.visible = false
	$WhiffCloud/AnimationPlayer.play("HuffPuff")
	yield($WhiffCloud/AnimationPlayer, "animation_finished")
	destroy()	
	
func expire():
	emit_signal("expired")
	state = State.EXPIRING
	$Base.visible = false
	$BlackBorder.visible = false
	$WhiffCloud.visible = true
	$WhiffCloud/AnimationPlayer.play("HuffPuff")
	yield($WhiffCloud/AnimationPlayer, "animation_finished")
	destroy()

func destroy():
	queue_free()
	#yield(get_tree().create_timer(1.0), "timeout")
	#get_tree().change_scene("res://Bullets/SimpleStaticTicking.tscn")

func click_on():
	print("click moving!")
	if state != State.TICKING:
		#print("Illegal click")
		return
	activate()
	
	#var allowance = abs(time_of_appearance+set_duration - OS.get_ticks_msec())
	#print("Allowance: %f" % allowance)
	#if allowance < activation_sensitivity:
	#	activate()
	#else:
	#	whiff()
	
func _ready():
	if not parent.is_class("Path2D"):
		printerr("Moving bullet must be spawned as a child of a Path2D node!")
		queue_free()
	spawn()
	reveal()
	launch()

func _on_Area2D_left_click():
	click_on()


func _on_Area2D_right_click():
	pass # Replace with function body.


func _on_Area2D_mouse_entered():
	print("entered")
	pass # Replace with function body.
