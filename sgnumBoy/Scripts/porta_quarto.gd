extends Node2D


var player_in_area := false

func _ready():
	if GlobalSingleton.mae_removida:
		$"../NavigationRegion2D/Mom".queue_free()

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("e"):
		Transition.fade_to_scene("res://Scenes/home.tscn")


func _on_area_2d_body_entered(body):
	print(body.get_name())
	if body.get_name() == "player":
		player_in_area = true
		$key_E.visible = true
	else:
		GlobalSingleton.mae_removida = true
		body.animation.play("idle")
		await get_tree().create_timer(0.8).timeout 
		body.queue_free()

func _on_area_2d_body_exited(body):
	if body.get_name() == "player":
		player_in_area = false
		$key_E.visible = false
