extends Node


var mae_removida : bool
var ultima_entrada := ""

func _ready():
	if "singletonGlobal" in SaveManager.save_data:
		var data = SaveManager.save_data["singletonGlobal"]
		mae_removida = data.get("mae_removida", false)
	else:
		mae_removida = false

func save_progress():
	SaveManager.save_data["singletonGlobal"] = {
		"mae_removida": mae_removida,
	}
	SaveManager.save()
