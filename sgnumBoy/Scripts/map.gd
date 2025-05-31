extends Node2D


@onready var map = $CanvasLayer/Control

func _ready():
	map.visible = false

func _input(event):
	if event.is_action_pressed("map"):
		if map.visible:
			map.visible = false
		else:
			map.visible = true


func _on_home_pressed():
	get_tree().change_scene_to_file("res://Scenes/home.tscn")


func _on_schol_pressed():
	get_tree().change_scene_to_file("res://Scenes/home.tscn")


func _on_supermarket_pressed():
	get_tree().change_scene_to_file("res://Scenes/home.tscn")


func _on_park_pressed():
	get_tree().change_scene_to_file("res://Scenes/home.tscn")
