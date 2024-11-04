extends Node2D

const COIN = preload("res://coin.tscn")
@export var dialogue : Array[String]

var which_line = -1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Interact"):
		which_line += 1
		if which_line >= dialogue.size():
			$DialogueBox.hide()
			which_line = -1
		else:
			$DialogueBox/PanelContainer/Text.text = dialogue[which_line]
		


func _on_area_2d_body_entered(body):
	if body.name== "Player":
		$DialogueBox.show()
		#print("open box")
		#var new_coin = COIN.instantiate()
		#new_coin.position.y -= 80
		#add_child(new_coin)


func _on_area_2d_body_exited(body):
		if body.name== "Player":
			$DialogueBox.hide()
