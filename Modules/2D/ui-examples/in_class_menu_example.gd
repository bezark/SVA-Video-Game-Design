extends Control

const LEVEL_1 = preload("res://level1.tscn")
func _on_start_button_down():
	#get_tree().change_scene_to_packed(LEVEL_1)
	get_tree().change_scene_to_file("res://level1.tscn")
