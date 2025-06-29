extends Node


var completed : bool
var current_phase : String
var current_question_index : int

func _ready():
	if "minigame_alfabeto" in SaveManager.save_data:
		var data = SaveManager.save_data["minigame_alfabeto"]
		completed = data.get("completed", false)
		current_phase = data.get("current_phase", "fase_1")
		current_question_index = data.get("current_question_index", 0)
		print("Alfabeto carregado:", current_phase, " : ", current_question_index)
	else:
		completed = false
		current_phase = "fase_1"
		current_question_index = 0

func save_progress():
	SaveManager.save_data["minigame_alfabeto"] = {
		"completed": completed,
		"current_phase": current_phase,
		"current_question_index": current_question_index
	}
	SaveManager.save()

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
		{"question": "res://Assets/UI/cards/musculo.png", "options": ["res://Assets/UI/alfabeto/M.png", "res://Assets/UI/alfabeto/N.png", "res://Assets/UI/alfabeto/O.png", "res://Assets/UI/alfabeto/P.png"], "correct": 0},
		{"question": "res://Assets/UI/cards/nariz.png", "options": ["res://Assets/UI/alfabeto/M.png", "res://Assets/UI/alfabeto/N.png", "res://Assets/UI/alfabeto/O.png", "res://Assets/UI/alfabeto/P.png"], "correct": 1},
		{"question": "res://Assets/UI/cards/coracao.png", "options": ["res://Assets/UI/alfabeto/M.png", "res://Assets/UI/alfabeto/N.png", "res://Assets/UI/alfabeto/O.png", "res://Assets/UI/alfabeto/P.png"], "correct": 2},
		{"question": "res://Assets/UI/cards/pulmao.png", "options": ["res://Assets/UI/alfabeto/M.png", "res://Assets/UI/alfabeto/N.png", "res://Assets/UI/alfabeto/O.png", "res://Assets/UI/alfabeto/P.png"], "correct": 3}
	],
	"fase_5": [
		{"question": "res://Assets/UI/cards/qatar.png", "options": ["res://Assets/UI/alfabeto/Q.png", "res://Assets/UI/alfabeto/R.png", "res://Assets/UI/alfabeto/S.png", "res://Assets/UI/alfabeto/T.png"], "correct": 0},
		{"question": "res://Assets/UI/cards/brasil.png", "options": ["res://Assets/UI/alfabeto/Q.png", "res://Assets/UI/alfabeto/R.png", "res://Assets/UI/alfabeto/S.png", "res://Assets/UI/alfabeto/T.png"], "correct": 1},
		{"question": "res://Assets/UI/cards/russia.png", "options": ["res://Assets/UI/alfabeto/Q.png", "res://Assets/UI/alfabeto/R.png", "res://Assets/UI/alfabeto/S.png", "res://Assets/UI/alfabeto/T.png"], "correct": 2},
		{"question": "res://Assets/UI/cards/portugal.png", "options": ["res://Assets/UI/alfabeto/Q.png", "res://Assets/UI/alfabeto/R.png", "res://Assets/UI/alfabeto/S.png", "res://Assets/UI/alfabeto/T.png"], "correct": 3}
	],
	"fase_6": [
		{"question": "res://Assets/UI/cards/pudim.png", "options": ["res://Assets/UI/alfabeto/U.png", "res://Assets/UI/alfabeto/V.png", "res://Assets/UI/alfabeto/W.png", "res://Assets/UI/alfabeto/X.png"], "correct": 0},
		{"question": "res://Assets/UI/cards/sorvete.png", "options": ["res://Assets/UI/alfabeto/U.png", "res://Assets/UI/alfabeto/V.png", "res://Assets/UI/alfabeto/W.png", "res://Assets/UI/alfabeto/X.png"], "correct": 1},
		{"question": "res://Assets/UI/cards/wafer.png", "options": ["res://Assets/UI/alfabeto/U.png", "res://Assets/UI/alfabeto/V.png", "res://Assets/UI/alfabeto/W.png", "res://Assets/UI/alfabeto/X.png"], "correct": 2},
		{"question": "res://Assets/UI/cards/xicara.png", "options": ["res://Assets/UI/alfabeto/U.png", "res://Assets/UI/alfabeto/V.png", "res://Assets/UI/alfabeto/W.png", "res://Assets/UI/alfabeto/X.png"], "correct": 3},
		{"question": "res://Assets/UI/cards/yakisoba.png", "options": ["res://Assets/UI/alfabeto/Y.png", "res://Assets/UI/alfabeto/Z.png", "res://Assets/UI/alfabeto/W.png", "res://Assets/UI/alfabeto/X.png"], "correct": 0},
		{"question": "res://Assets/UI/cards/zumbi.png", "options": ["res://Assets/UI/alfabeto/Y.png", "res://Assets/UI/alfabeto/Z.png", "res://Assets/UI/alfabeto/W.png", "res://Assets/UI/alfabeto/X.png"], "correct": 1}
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
		current_phase = "fase_6"
	elif current_phase == "fase_6":
		current_phase = "completed"
		completed = true
	save_progress()
	
func exit():
	completed = true
	await get_tree().create_timer(5).timeout
	Transition.fade_to_scene("res://Scenes/tile_map_quarto.tscn")

func reset():
	completed = false
	current_phase = "fase_1"
	current_question_index = 0
	save_progress()
