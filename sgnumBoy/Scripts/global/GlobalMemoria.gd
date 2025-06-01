extends Node

var completed = false
var current_phase = "fase_1"
var current_question_index = 0

# Cada fase possui um conjunto de pares de cartas
var memory_data = {
	"fase_1": [
		{"pair": ["res://Assets/UI/cards/apple.png", "res://Assets/UI/cards/apple.png"]},
		{"pair": ["res://Assets/UI/cards/banana.png", "res://Assets/UI/cards/banana.png"]},
		{"pair": ["res://Assets/UI/cards/cherry.png", "res://Assets/UI/cards/cherry.png"]},
		{"pair": ["res://Assets/UI/cards/grape.png", "res://Assets/UI/cards/grape.png"]}
	],
	"fase_2": [
		{"pair": ["res://Assets/UI/cards/cat.png", "res://Assets/UI/cards/cat.png"]},
		{"pair": ["res://Assets/UI/cards/dog.png", "res://Assets/UI/cards/dog.png"]},
		{"pair": ["res://Assets/UI/cards/fox.png", "res://Assets/UI/cards/fox.png"]},
		{"pair": ["res://Assets/UI/cards/owl.png", "res://Assets/UI/cards/owl.png"]}
	]
}

func next_level():
	current_question_index = 0
	if current_phase == "fase_1":
		current_phase = "fase_2"
	elif current_phase == "fase_2":
		current_phase = "completed"
		completed = true

func exit():
	completed = true
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://Scenes/home.tscn")
