extends Node2D


func _ready():
	var entrada = GlobalSingleton.ultima_entrada
	match entrada:
		"sala_quarto":
			$player.global_position = $positions/quarto_position.global_position
		"sala_cozinha":
			$player.global_position = $positions/cozinha_position.global_position
		"memoria":
			$player.global_position = $positions/memoria.global_position
		"map_sala":
			$player.global_position = $positions/map_sala.global_position
