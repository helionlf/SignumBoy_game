extends Node2D


func _ready():
	var entrada = GlobalSingleton.ultima_entrada
	match entrada:
		"map_supermercado":
			$player.global_position = $positions/map_supermercado.global_position
		"prateleiras":
			$player.global_position = $positions/prateleiras.global_position
