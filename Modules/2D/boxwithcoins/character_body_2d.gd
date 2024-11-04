extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0
var interactable


var state = null






func _physics_process(delta):
	#
	#if Input.is_action_just_pressed("ui_accept"):
		#state = "fishing"
	#
	#match state:
		#"fishing_start":
			##start fishing
			#pass
		#"fishing":
				#
			#pass
			##fish idle
			#
	#
	#
	#
	#
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_area_entered(area):
	print("player is near ", area)
	interactable = area.get_parent()
