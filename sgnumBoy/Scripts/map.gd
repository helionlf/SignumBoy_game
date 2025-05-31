extends Node2D


@onready var map = $CanvasLayer/Control

func _ready():
	map.visible = false


func _on_home_pressed():
	Transition.fade_to_scene("res://Scenes/home.tscn")


func _on_schol_pressed():
	Transition.fade_to_scene("res://Scenes/home.tscn")


func _on_supermarket_pressed():
	Transition.fade_to_scene("res://Scenes/tile_map_supermarket.tscn")


func _on_park_pressed():
	Transition.fade_to_scene("res://Scenes/home.tscn")


func _on_area_2d_body_entered(body):
	if body.get_name() == "player":
		map.visible = true

func _on_area_2d_body_exited(body):
	if body.get_name() == "player":
		map.visible = false
