extends CharacterBody2D

var SPEED = 200.0
var JUMP_force = -400.0
@onready var animation := $AnimatedSprite2D
var jump := false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_force
		jump = true 
	elif is_on_floor():
		jump = false
		
	#almentar velocidade
	if Input.is_action_pressed("corre rapido"):
		#animation.playback_speed = 2.5
		SPEED = 300
	else:
		#animation.playback_speed = 1.0 
		SPEED = 200
		
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animation.scale.x = direction
		if jump == false:
			animation.play("run")	
		elif jump:
			animation.play("jump")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("idle")
	move_and_slide()


			
	


	
