extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	if Input.is_action_just_pressed("ui_right"):
		velocity.x = SPEED
	if Input.is_action_just_pressed("ui_left"):
		velocity.x = -SPEED
	

	move_and_slide()
