extends Node2D


@onready var anim = $CanvasLayer/TextureRect/AnimatedSprite2D

func _process(delta):
	if GlobalSMM.palavra == "caneta":
		anim.play("caneta")
	elif GlobalSMM.palavra == "caderno":
		anim.play("caderno")
	elif GlobalSMM.palavra == "apontador":
		anim.play("apontador")
	else:
		anim.play("borracha")
