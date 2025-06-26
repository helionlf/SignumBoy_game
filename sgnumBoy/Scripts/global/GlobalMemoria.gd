extends Node


var completed : bool
var current_phase : String
var current_question_index : int

func _ready():
	if "memory_module" in SaveManager.save_data:
		var data = SaveManager.save_data["memory_module"]
		completed = data.get("completed", false)
		current_phase = data.get("current_phase", "fase_1")
		current_question_index = data.get("current_question_index", 0)
		print("Memória carregada:", current_phase, " : ", current_question_index)
	else:
		completed = false
		current_phase = "fase_1"
		current_question_index = 0

func save_progress():
	SaveManager.save_data["memory_module"] = {
		"completed": completed,
		"current_phase": current_phase,
		"current_question_index": current_question_index
	}
	SaveManager.save()

var memory_data = {
	"fase_1": [
		{"pair": [
			{"id": 1, "type": "texture", "path": "res://Assets/UI/cards/apontador.png"},
			{"id": 1, "type": "animation", "path": "res://Assets/librasAnim/apontador.tres"}
		]},
		{"pair": [
			{"id": 2, "type": "texture", "path": "res://Assets/UI/cards/borracha.png"},
			{"id": 2, "type": "animation", "path": "res://Assets/librasAnim/borracha.tres"}
		]},
		{"pair": [
			{"id": 3, "type": "texture", "path": "res://Assets/UI/cards/caderno.png"},
			{"id": 3, "type": "animation", "path": "res://Assets/librasAnim/caderno.tres"}
		]},
		{"pair": [
			{"id": 4, "type": "texture", "path": "res://Assets/UI/cards/caneta.png"},
			{"id": 4, "type": "animation", "path": "res://Assets/librasAnim/caneta.tres"}
		]}
	],
	"fase_2": [
		{"pair": [
			{"id": 1, "type": "texture", "path": "res://Assets/UI/cards/ovos.png"},
			{"id": 1, "type": "animation", "path": "res://Assets/librasAnim/ovo.tres"}
		]},
		{"pair": [
			{"id": 2, "type": "texture", "path": "res://Assets/UI/cards/leite.png"},
			{"id": 2, "type": "animation", "path": "res://Assets/librasAnim/leite.tres"}
		]},
		{"pair": [
			{"id": 3, "type": "texture", "path": "res://Assets/UI/cards/manteiga.png"},
			{"id": 3, "type": "animation", "path": "res://Assets/librasAnim/manteiga.tres"}
		]},
		{"pair": [
			{"id": 4, "type": "texture", "path": "res://Assets/UI/cards/acucar.png"},
			{"id": 4, "type": "animation", "path": "res://Assets/librasAnim/acucar.tres"}
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
		GlobalSM.unlocked = true
	save_progress()

func exit():
	await get_tree().create_timer(4).timeout
	get_tree().change_scene_to_file("res://Scenes/home.tscn")

func reset():
	completed = false
	current_phase = "fase_1"
	current_question_index = 0
	save_progress()
