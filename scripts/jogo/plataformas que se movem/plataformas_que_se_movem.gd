extends Node2D

const wait_duration := 1.0

@onready var platform := $AnimatableBody2D
@export var move_speed := 3.0
@export var distance := 12
@export var move_horizonta := true

var follow := Vector2.ZERO
var platform_center := 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
