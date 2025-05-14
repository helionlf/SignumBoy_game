extends Node


var completed = false

var current_phase = "fase_1"
var current_question_index = 0

var quiz_data = {
	#TEM QUE CRIAR UM VETOR COM CADA OPÇÂO PRA CADA FASE
	"fase_1": [
		{"question": "res://Assets/UI/cards/aranha.png", "options": ["res://Assets/UI/alfabeto/A.png", "res://Assets/UI/alfabeto/B.png", "res://Assets/UI/alfabeto/C.png", "res://Assets/UI/alfabeto/D.png"], "correct": 0},
		{"question": "res://Assets/UI/cards/abelha.png", "options": ["res://Assets/UI/alfabeto/A.png", "res://Assets/UI/alfabeto/B.png", "res://Assets/UI/alfabeto/C.png", "res://Assets/UI/alfabeto/D.png"], "correct": 1},
		{"question": "res://Assets/UI/cards/cachorro.png", "options": ["res://Assets/UI/alfabeto/A.png", "res://Assets/UI/alfabeto/B.png", "res://Assets/UI/alfabeto/C.png", "res://Assets/UI/alfabeto/D.png"], "correct": 2},
		{"question": "res://Assets/UI/cards/panda.png", "options": ["res://Assets/UI/alfabeto/A.png", "res://Assets/UI/alfabeto/B.png", "res://Assets/UI/alfabeto/C.png", "res://Assets/UI/alfabeto/D.png"], "correct": 3}
	],
	"fase_2": [
		{"question": "res://Assets/UI/cards/panela.png", "options": ["res://Assets/UI/alfabeto/E.png", "res://Assets/UI/alfabeto/I.png", "res://Assets/UI/alfabeto/G.png", "res://Assets/UI/alfabeto/H.png"], "correct": 0},
		{"question": "res://Assets/UI/cards/faca.png", "options": ["res://Assets/UI/alfabeto/E.png", "res://Assets/UI/alfabeto/I.png", "res://Assets/UI/alfabeto/G.png", "res://Assets/UI/alfabeto/H.png"], "correct": 1},
		{"question": "res://Assets/UI/cards/seringa.png", "options": ["res://Assets/UI/alfabeto/E.png", "res://Assets/UI/alfabeto/I.png", "res://Assets/UI/alfabeto/G.png", "res://Assets/UI/alfabeto/H.png"], "correct": 2},
		{"question": "res://Assets/UI/cards/chave.png", "options": ["res://Assets/UI/alfabeto/E.png", "res://Assets/UI/alfabeto/I.png", "res://Assets/UI/alfabeto/G.png", "res://Assets/UI/alfabeto/H.png"], "correct": 3}
	]
}

func next_level():
	current_question_index = 0
	if current_phase == "fase_1":
		current_phase = "fase_2"
	elif current_phase == "fase_2":
		current_phase = "completed"
		completed = true
		

	#if current_phase == "fase_2":
		#current_phase = "completed"
	#TEM QUE CRIAR UM IF PRA CADA FASE
		
func exit():
	completed = true
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://Scenes/home.tscn")
	
