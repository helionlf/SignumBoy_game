extends Node


var completed : bool
var fruta : String

func _ready():
	if "minigame_frutas" in SaveManager.save_data:
		var data = SaveManager.save_data["minigame_frutas"]
		completed = data.get("completed", false)
		fruta = data.get("fruta", "banana")
		print("Frutas carregado:", fruta, " : ", completed)
	else:
		completed = false
		fruta = "banana"

func save_progress():
	SaveManager.save_data["minigame_frutas"] = {
		"completed": completed,
		"fruta": fruta,
	}
	SaveManager.save()

func next_level():
	if fruta == "banana":
		fruta = "maçã"
	elif fruta == "maçã":
		fruta = "uva"
	elif fruta == "uva":
		fruta = "pêra"
	elif fruta == "pêra":
		fruta = "morango"
	elif fruta == "morango":
		fruta = "abacaxi"
	elif fruta == "abacaxi":
		fruta = "completed"
		completed = true
	save_progress()
	
func exit():
	completed = true
	await get_tree().create_timer(5).timeout
	Transition.fade_to_scene("res://Scenes/tile_map_quarto.tscn")

func reset():
	completed = false
	fruta = "banana"
	#save_progress()
