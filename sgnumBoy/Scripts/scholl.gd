extends Node2D


func _ready():
	var entrada = GlobalSingleton.ultima_entrada
	match entrada:
		"map_escola":
			$player.global_position = $positions/map_position.global_position
		"quadro_escola":
			$player.global_position = $positions/quadro_escola.global_position
