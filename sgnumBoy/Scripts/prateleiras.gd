extends Node2D


var player_in_area := false

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("e") and GlobalSM.unlocked:
		Transition.fade_to_scene("res://Scenes/supermarket_mission.tscn")


func _on_area_2d_body_entered(body):
	if body.get_name() == "player" and GlobalSM.unlocked:
		player_in_area = true
		$key_E.visible = true

func _on_area_2d_body_exited(body):
	if body.get_name() == "player" and GlobalSM.unlocked:
		player_in_area = false
		$key_E.visible = false
