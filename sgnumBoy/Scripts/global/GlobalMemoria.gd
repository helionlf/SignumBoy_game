extends Node

var completed = false
var current_phase = "fase_1"
var current_question_index = 0


var memory_data = {
	"fase_1": [
		{"pair": [
			{"id": 1, "type": "texture", "path": "res://Assets/UI/cards/aranha.png"},
			{"id": 1, "type": "animation", "path": "res://Assets/librasAnim/apontador.tres"}
		]},
		{"pair": [
			{"id": 2, "type": "texture", "path": "res://Assets/UI/cards/cachorro.png"},
			{"id": 2, "type": "animation", "path": "res://Assets/librasAnim/borracha.tres"}
		]},
		{"pair": [
			{"id": 3, "type": "texture", "path": "res://Assets/UI/cards/panda.png"},
			{"id": 3, "type": "animation", "path": "res://Assets/librasAnim/caderno.tres"}
		]},
		{"pair": [
			{"id": 4, "type": "texture", "path": "res://Assets/UI/cards/chave.png"},
			{"id": 4, "type": "animation", "path": "res://Assets/librasAnim/caneta.tres"}
		]}
	],
	"fase_2": [
		{"pair": [
			{"id": 1, "type": "texture", "path": "res://Assets/UI/cards/cat.png"},
			{"id": 1, "type": "animation", "path": "res://Assets/librasAnim/cat_gesto.tres"}
		]},
		{"pair": [
			{"id": 2, "type": "texture", "path": "res://Assets/UI/cards/dog.png"},
			{"id": 2, "type": "animation", "path": "res://Assets/librasAnim/dog_gesto.tres"}
		]},
		{"pair": [
			{"id": 3, "type": "texture", "path": "res://Assets/UI/cards/fox.png"},
			{"id": 3, "type": "animation", "path": "res://Assets/librasAnim/fox_gesto.tres"}
		]},
		{"pair": [
			{"id": 4, "type": "texture", "path": "res://Assets/UI/cards/owl.png"},
			{"id": 4, "type": "animation", "path": "res://Assets/librasAnim/owl_gesto.tres"}
		]}
	]
}


func next_level():
	if current_phase == "fase_1":
		if GlobalSMM.completed:
			current_phase = "fase_2"
		else:
			current_phase = "fase_1"
			GlobalSMM.unlocked = true
	elif current_phase == "fase_2":
		current_phase = "completed"
		completed = true

func exit():
	await get_tree().create_timer(4).timeout
	get_tree().change_scene_to_file("res://Scenes/home.tscn")
