extends Node2D

const wait_duration := 1.0

@onready var platform := $AnimatableBody2D
@export var move_speed := 50.0
@export var distance := 192
@export var move_horizontal := true

var follow := Vector2.ZERO
#var platform_center := 1

func _ready():
	move_platform()

func _process(_delta):
	platform.position = platform.position.lerp(follow,0.5)

func move_platform():
	var move_direction
	if move_horizontal:
		move_direction = Vector2.RIGHT * distance
	else:
		move_direction = Vector2.UP * distance
	
	var duration = move_direction.length() / float(move_speed) #float(move_speed * platform_center) ?
	
	var platform_tween = create_tween().set_loops().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	platform_tween.tween_property(self, "follow", move_direction, duration).set_delay(wait_duration)
	platform_tween.tween_property(self, "follow", Vector2.ZERO, duration).set_delay(wait_duration)
