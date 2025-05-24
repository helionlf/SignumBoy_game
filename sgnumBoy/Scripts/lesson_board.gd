extends Node2D


func _ready():
	$CanvasLayer/board/alfabeto.visible = false
	$CanvasLayer/board/schoolMaterials.visible = false

func _process(delta):
	if GlobalMGA.completed:
		$CanvasLayer/board/alfabeto.visible = true
	if GlobalSMM.completed:
		$CanvasLayer/board/schoolMaterials.visible = true
