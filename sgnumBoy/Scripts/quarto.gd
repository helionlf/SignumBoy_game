extends Node2D


func _ready():
	var entrada = GlobalSingleton.ultima_entrada
	match entrada:
		"quarto_sala":
			$player.global_position = $positions/sala_position.global_position
		"quadro_quarto":
			$player.global_position = $positions/quadro_position.global_position
		"tablet":
			$player.global_position = $positions/tablet_position.global_position

