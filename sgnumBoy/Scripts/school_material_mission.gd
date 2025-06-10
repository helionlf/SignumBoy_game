extends Node2D


@onready var anim = $CanvasLayer/ColorRect/AnimatedSprite2D

func _process(delta):
	if GlobalSMM.palavra == "caneta":
		anim.play("caneta")
	elif GlobalSMM.palavra == "caderno":
		anim.play("caderno")
	elif GlobalSMM.palavra == "apontador":
		anim.play("apontador")
	else:
		anim.play("borracha")

func _input(event):
	if event.is_action_pressed("sair"):
		Transition.fade_to_scene("res://Scenes/home.tscn")


func _on_sair_pressed():
	Transition.fade_to_scene("res://Scenes/home.tscn")
