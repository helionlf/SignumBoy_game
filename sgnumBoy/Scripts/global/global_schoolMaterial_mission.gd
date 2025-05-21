extends Node


var completed = false

var palavra = "livro"


func next_level():
	if palavra == "livro":
		palavra = "caneta"
	elif palavra == "caneta":
		palavra = "completed"
		completed = true

func exit():
	completed = true
	await get_tree().create_timer(8).timeout
	get_tree().change_scene_to_file("res://Scenes/home.tscn")
	
