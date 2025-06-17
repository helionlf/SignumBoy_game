extends CanvasLayer


func _on_start_pressed():
	Transition.fade_to_scene("res://Scenes/dialogue_inicio.tscn")


func _on_quit_pressed():
	get_tree().quit()
