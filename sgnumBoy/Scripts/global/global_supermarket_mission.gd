extends Node


var completed = false

var current_phase = "fase_1"
var current_question_index = 0

var data = {
	#TEM QUE CRIAR UM VETOR COM CADA OPÇÂO PRA CADA FASE
	"fase_1": [
		{"cenario": "res://Assets/UI/prateleiras.png", "options": ["res://Assets/UI/trigo.png", "res://Assets/UI/ovos.png", "res://Assets/UI/tomate.png"], "correct": 1}
	],
	"fase_2": [
		{"cenario": "res://Assets/UI/prateleiras.png", "options": ["res://Assets/UI/manteiga.png", "res://Assets/UI/biscoito.png", "res://Assets/UI/tomate.png"], "correct": 0}
	],
	"fase_3": [
		{"cenario": "res://Assets/UI/prateleiras.png", "options": ["res://Assets/UI/macarrao.png", "res://Assets/UI/ovos.png", "res://Assets/UI/fermento.png"], "correct": 2}
	],
	"fase_4": [
		{"cenario": "res://Assets/UI/prateleiras.png", "options": ["res://Assets/UI/suco.png", "res://Assets/UI/leite.png", "res://Assets/UI/iogurte.png"], "correct": 1}
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
		current_phase = "completed"
		set_completed()
		
	
func exit():
	await get_tree().create_timer(5).timeout
	next_level()
	Transition.fade_to_scene("res://Scenes/tile_map_quarto.tscn")
	


func set_completed():
	completed = true
	await get_tree().create_timer(5).timeout
	Transition.fade_to_scene("res://Scenes/tile_map_quarto.tscn")
	
