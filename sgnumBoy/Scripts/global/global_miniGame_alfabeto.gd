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
		{"question": "res://Assets/UI/cards/panela.png", "options": ["res://Assets/UI/alfabeto/E.png", "res://Assets/UI/alfabeto/F.png", "res://Assets/UI/alfabeto/G.png", "res://Assets/UI/alfabeto/H.png"], "correct": 0},
		{"question": "res://Assets/UI/cards/faca.png", "options": ["res://Assets/UI/alfabeto/E.png", "res://Assets/UI/alfabeto/F.png", "res://Assets/UI/alfabeto/G.png", "res://Assets/UI/alfabeto/H.png"], "correct": 1},
		{"question": "res://Assets/UI/cards/seringa.png", "options": ["res://Assets/UI/alfabeto/E.png", "res://Assets/UI/alfabeto/F.png", "res://Assets/UI/alfabeto/G.png", "res://Assets/UI/alfabeto/H.png"], "correct": 2},
		{"question": "res://Assets/UI/cards/chave.png", "options": ["res://Assets/UI/alfabeto/E.png", "res://Assets/UI/alfabeto/F.png", "res://Assets/UI/alfabeto/G.png", "res://Assets/UI/alfabeto/H.png"], "correct": 3}
	],
	"fase_3": [
		{"question": "res://Assets/UI/cards/limao.png", "options": ["res://Assets/UI/alfabeto/I.png", "res://Assets/UI/alfabeto/J.png", "res://Assets/UI/alfabeto/K.png", "res://Assets/UI/alfabeto/L.png"], "correct": 0},
		{"question": "res://Assets/UI/cards/jaca.png", "options": ["res://Assets/UI/alfabeto/I.png", "res://Assets/UI/alfabeto/J.png", "res://Assets/UI/alfabeto/K.png", "res://Assets/UI/alfabeto/L.png"], "correct": 1},
		{"question": "res://Assets/UI/cards/kiwi.png", "options": ["res://Assets/UI/alfabeto/I.png", "res://Assets/UI/alfabeto/J.png", "res://Assets/UI/alfabeto/K.png", "res://Assets/UI/alfabeto/L.png"], "correct": 2},
		{"question": "res://Assets/UI/cards/laranja.png", "options": ["res://Assets/UI/alfabeto/I.png", "res://Assets/UI/alfabeto/J.png", "res://Assets/UI/alfabeto/K.png", "res://Assets/UI/alfabeto/L.png"], "correct": 3}
	],
	"fase_4": [
		{"question": "res://Assets/UI/cards/musculo.png", "options": ["res://Assets/UI/alfabeto/M.png", "res://Assets/UI/alfabeto/N.png", "res://Assets/UI/alfabeto/O.png", "res://Assets/UI/alfabeto/L.png"], "correct": 0},
		{"question": "res://Assets/UI/cards/nariz.png", "options": ["res://Assets/UI/alfabeto/M.png", "res://Assets/UI/alfabeto/N.png", "res://Assets/UI/alfabeto/O.png", "res://Assets/UI/alfabeto/L.png"], "correct": 1},
		{"question": "res://Assets/UI/cards/coracao.png", "options": ["res://Assets/UI/alfabeto/M.png", "res://Assets/UI/alfabeto/N.png", "res://Assets/UI/alfabeto/O.png", "res://Assets/UI/alfabeto/L.png"], "correct": 2},
		{"question": "res://Assets/UI/cards/pulmao.png", "options": ["res://Assets/UI/alfabeto/M.png", "res://Assets/UI/alfabeto/N.png", "res://Assets/UI/alfabeto/O.png", "res://Assets/UI/alfabeto/L.png"], "correct": 3}
	],
	"fase_5": [
		{"question": "res://Assets/UI/cards/qatar.png", "options": ["res://Assets/UI/alfabeto/Q.png", "res://Assets/UI/alfabeto/R.png", "res://Assets/UI/alfabeto/S.png", "res://Assets/UI/alfabeto/T.png"], "correct": 0},
		{"question": "res://Assets/UI/cards/brasil.png", "options": ["res://Assets/UI/alfabeto/Q.png", "res://Assets/UI/alfabeto/R.png", "res://Assets/UI/alfabeto/S.png", "res://Assets/UI/alfabeto/T.png"], "correct": 1},
		{"question": "res://Assets/UI/cards/russia.png", "options": ["res://Assets/UI/alfabeto/Q.png", "res://Assets/UI/alfabeto/R.png", "res://Assets/UI/alfabeto/S.png", "res://Assets/UI/alfabeto/T.png"], "correct": 2},
		{"question": "res://Assets/UI/cards/portugal.png", "options": ["res://Assets/UI/alfabeto/Q.png", "res://Assets/UI/alfabeto/R.png", "res://Assets/UI/alfabeto/S.png", "res://Assets/UI/alfabeto/T.png"], "correct": 3}
	]
}

func next_level():
	current_question_index = 0
	if current_phase == "fase_1":
		current_phase = "fase_2"
	elif current_phase == "fase_2":
		current_phase = "fase_3"
	elif current_phase == "fase_3":
		current_phase = "fase_4"
	elif current_phase == "fase_4":
		current_phase = "fase_5"
	elif current_phase == "fase_5":
		current_phase = "completed"
		completed = true
	
func exit():
	completed = true
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://Scenes/home.tscn")
	
