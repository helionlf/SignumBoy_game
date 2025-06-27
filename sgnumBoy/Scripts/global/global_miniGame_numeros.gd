extends Node


var completed : bool
var acertos : int

func _ready():
	if "minigame_número" in SaveManager.save_data:
		var data = SaveManager.save_data["minigame_número"]
		completed = data.get("completed", false)
		print("Números:", completed)
	else:
		completed = false

func save_progress():
	SaveManager.save_data["minigame_número"] = {
		"completed": completed,
	}
	SaveManager.save()

func marcar_acerto():
	acertos += 1
	if acertos >= 10:
		completed = true
		save_progress()

func reset():
	completed = false
	acertos = 0
