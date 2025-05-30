extends Node


var completed = false

var palavra = "caneta"


func next_level():
	if palavra == "caneta":
		palavra = "caderno"
	elif palavra == "caderno":
		palavra = "apontador"
	elif palavra == "apontador":
		palavra = "borracha"
	else:
		palavra = "completed"
		completed = true

func exit():
	completed = true
	await get_tree().create_timer(7).timeout
	Transition.fade_to_scene("res://Scenes/home.tscn")
	
