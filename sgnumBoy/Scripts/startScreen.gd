extends CanvasLayer


func _on_start_pressed():
	if GlobalSingleton.mae_removida:
		Transition.fade_to_scene("res://Scenes/tile_map_quarto.tscn")
	else:
		Transition.fade_to_scene("res://Scenes/dialogue_inicio.tscn")

func _on_quit_pressed():
	get_tree().quit()


func _on_new_game_pressed():
	SaveManager.reset_save()
	GlobalM.reset()
	GlobalSM.reset()
	GlobalSMM.reset()
	GlobalMGN.reset()
	GlobalMGA.reset()
	get_tree().reload_current_scene()
