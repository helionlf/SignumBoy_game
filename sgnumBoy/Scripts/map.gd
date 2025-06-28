extends Node2D


@onready var map = $CanvasLayer/Control

func _ready():
	map.visible = false

func _on_home_pressed():
	GlobalSingleton.ultima_entrada = "map_sala"
	Transition.fade_to_scene("res://Scenes/home.tscn")

func _on_schol_pressed():
	GlobalSingleton.ultima_entrada = "map_escola"
	Transition.fade_to_scene("res://Scenes/tile_map_scholl.tscn")

func _on_supermarket_pressed():
	GlobalSingleton.ultima_entrada = "map_supermercado"
	Transition.fade_to_scene("res://Scenes/tile_map_supermarket.tscn")

func _on_area_2d_body_entered(body):
	if body.get_name() == "player":
		body.set_physics_process(false)
		map.visible = true
