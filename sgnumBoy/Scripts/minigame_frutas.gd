extends Node2D


var fruta_scene: PackedScene = preload("res://Scenes/fruta.tscn")
var frutas = ["banana", "maçã", "uva", "pêra", "morango", "abacaxi"]
var positions = [
	Vector2(239, -47), 
	Vector2(267, -47), 
	Vector2(385, -47), 
	Vector2(506, -47), 
	Vector2(631, -47), 
	Vector2(745, -47), 
	Vector2(863, -47), 
	Vector2(984, -47)]

func choose_position():
	return positions.pick_random()
	
func choose_type(favoravel: String) -> String:
	var chance_baixa = 0.4
	var frutas_restantes = frutas.filter(func(f): return f != favoravel)
	
	var r = randf()
	
	if r < chance_baixa:
		return favoravel
	else:
		return frutas_restantes.pick_random()

func _on_timer_timeout():
	var pos = choose_position()
	var fruta = fruta_scene.instantiate()
	fruta.position = pos
	fruta.type = choose_type(GlobalMGF.fruta)
	print(fruta.type)
	add_child(fruta)
	
