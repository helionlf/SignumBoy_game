extends Node


var unlocked : bool
var completed : bool
var current_phase : String
var current_question_index : int

func _ready():
	if "missão_supermercado" in SaveManager.save_data:
		var data = SaveManager.save_data["missão_supermercado"]
		unlocked = data.get("unlocked", false)
		completed = data.get("completed", false)
		current_phase = data.get("current_phase", "fase_1")
		current_question_index = data.get("current_question_index", 0)
		print("Supermercado carregado:", current_phase, " : ", current_question_index)
	else:
		unlocked = false
		completed = false
		current_phase = "fase_1"
		current_question_index = 0

func save_progress():
	SaveManager.save_data["missão_supermercado"] = {
		"unlocked": unlocked,
		"completed": completed,
		"current_phase": current_phase,
		"current_question_index": current_question_index
	}
	SaveManager.save()

var data = {
	#TEM QUE CRIAR UM VETOR COM CADA OPÇÂO PRA CADA FASE
	"fase_1": [
		{"cenario": "res://Assets/UI/prateleiras.png", "options": ["res://Assets/UI/trigo.png", "res://Assets/UI/ovos.png", "res://Assets/UI/tomate.png"], "correct": 1}
	],
	"fase_2": [
		{"cenario": "res://Assets/UI/prateleiras.png", "options": ["res://Assets/UI/manteiga.png", "res://Assets/UI/biscoito.png", "res://Assets/UI/fermento.png"], "correct": 0}
	],
	"fase_3": [
		{"cenario": "res://Assets/UI/prateleiras.png", "options": ["res://Assets/UI/macarrao.png", "res://Assets/UI/ovos.png", "res://Assets/UI/acucar_sm.png"], "correct": 2}
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
	save_progress()
		
	
func exit():
	await get_tree().create_timer(2).timeout
	next_level()
	if current_phase != "completed":
		Transition.fade_to_scene("res://Scenes/tile_map_supermarket.tscn")
	


func set_completed():
	completed = true
	await get_tree().create_timer(2).timeout
	Transition.fade_to_scene("res://Scenes/tile_map_supermarket.tscn")

func reset():
	unlocked = false
	completed = false
	current_phase = "fase_1"
	current_question_index = 0
	save_progress()
