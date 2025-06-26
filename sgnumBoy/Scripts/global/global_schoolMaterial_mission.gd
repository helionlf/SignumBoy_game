extends Node

var unlocked : bool
var completed : bool
var palavra : String

func _ready():
	if "smm_module" in SaveManager.save_data:
		var data = SaveManager.save_data["smm_module"]
		unlocked = data.get("unlocked", false)
		completed = data.get("completed", false)
		palavra = data.get("palavra", "caneta")
		print("Material Escolar carregado:", palavra)
	else:
		unlocked = false
		completed = false
		palavra = "caneta"

func save_progress():
	SaveManager.save_data["smm_module"] = {
		"unlocked": unlocked,
		"completed": completed,
		"palavra": palavra
	}
	SaveManager.save()

func next_level():
	if palavra == "caneta":
		palavra = "caderno"
	elif palavra == "caderno":
		palavra = "apontador"
	elif palavra == "apontador":
		palavra = "borracha"
	else:
		palavra = "completed"
		GlobalM.current_phase = "fase_2"
		GlobalM.save_progress()
		completed = true
	save_progress()

func exit():
	completed = true
	await get_tree().create_timer(7).timeout
	Transition.fade_to_scene("res://Scenes/tile_map_scholl.tscn")

func reset():
	unlocked = false
	completed = false
	palavra = "caneta"
	save_progress()
