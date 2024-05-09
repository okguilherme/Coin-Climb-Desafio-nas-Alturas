extends CharacterBody2D

const  SPEED = 300.0
var JUMP_force = -400.0

var booleano = 0
var botao_pressionado 

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_force

	var num = Input.is_action_pressed("corre rapido")
	print (num)
	
	if num:
		velo *= 2


	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * velo
	else:
		velocity.x = move_toward(velocity.x, 0, velo)

	move_and_slide()
	
