extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -800.0


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		print(velocity)
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	#if Input.is_action_pressed("ui_up"):
		#velocity.x = -SPEED
	#if Input.is_action_pressed("ui_left"):
		#velocity.x = -SPEED
	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
