extends Node2D

export var activation_sensitivity:int = 200

signal launched
signal whiffed
signal expired
signal activated

var activated:bool = false
var time_of_appearance:int = -1.0
var set_duration:int = 0.0


enum State { DORMANT, TICKING, ACTIVATING, WHIFFING, EXPIRING }
var state:int = State.DORMANT

func spawn():
	visible = false
	$Base.visible = false
	$BlackBorder.visible = false
	$HugCircle.visible = false
	$WhiffCloud.visible = false
	$Success.visible = false
	state = State.DORMANT

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
	$HugCircle.visible = true
	$HugCircle/AnimationPlayer.playback_speed = 1/duration
	$HugCircle/AnimationPlayer.play("Hug")
	set_duration = duration*1000
	time_of_appearance = OS.get_ticks_msec()
	yield($HugCircle/AnimationPlayer, "animation_finished")
	if state == State.TICKING:
		expire()
	
func activate():
	emit_signal("activated")
	state = State.ACTIVATING
	$Base.visible = false
	$BlackBorder.visible = false
	$HugCircle.visible = false
	$HugCircle/AnimationPlayer.stop()
	$Success.visible = true
	$Success/AnimationPlayer.play("Splash")
	yield($Success/AnimationPlayer, "animation_finished")
	destroy()
	
func whiff():
	emit_signal("whiffed")
	#print("whiffed")
	state = State.WHIFFING
	$Base.visible = false
	$BlackBorder.visible = false
	$HugCircle.visible = false
	$HugCircle/AnimationPlayer.stop()
	$WhiffCloud.visible = true
	$WhiffCloud/AnimationPlayer.play("HuffPuff")
	yield($WhiffCloud/AnimationPlayer, "animation_finished")
	destroy()	
	
func expire():
	emit_signal("expired")
	#print("expired")
	state = State.EXPIRING
	$Base.visible = false
	$BlackBorder.visible = false
	$HugCircle.visible = false
	$HugCircle/AnimationPlayer.stop()
	$WhiffCloud.visible = true
	$WhiffCloud/AnimationPlayer.play("HuffPuff")
	yield($WhiffCloud/AnimationPlayer, "animation_finished")
	destroy()

func destroy():
	queue_free()
	#yield(get_tree().create_timer(1.0), "timeout")
	#get_tree().change_scene("res://Bullets/SimpleStaticTicking.tscn")

func click_on():
	print("click!")
	if state != State.TICKING:
		#print("Illegal click")
		return
	
	var allowance = abs(time_of_appearance+set_duration - OS.get_ticks_msec())
	#print("Allowance: %f" % allowance)
	if allowance < activation_sensitivity:
		activate()
	else:
		whiff()
	
func _ready():
	#print("_______")
	reveal()
	launch()
	#print("Works?")
	#yield(get_tree().create_timer(1.0), "timeout")
	#queue_free()

func _on_Area2D_left_click():
	click_on()


func _on_Area2D_right_click():
	pass # Replace with function body.


func _on_Area2D_mouse_entered():
	print("entered")
	pass # Replace with function body.
