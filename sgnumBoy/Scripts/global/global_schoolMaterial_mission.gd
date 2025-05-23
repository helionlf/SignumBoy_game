extends Node


var completed = false

var palavra = "caneta"


func next_level():
	if palavra == "caneta":
		palavra = "caderno"
	elif palavra == "caderno":
		palavra = "livro"
	elif palavra == "livro":
		palavra = "borracha"
	else:
		palavra = "completed"
		completed = true

func exit():
	completed = true
	await get_tree().create_timer(8).timeout
	get_tree().change_scene_to_file("res://Scenes/home.tscn")
	
