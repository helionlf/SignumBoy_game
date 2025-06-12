extends Node2D


func _ready():
	$CanvasLayer/board/alfabeto.visible = false
	$CanvasLayer/board/schoolMaterials.visible = false
	$CanvasLayer/board/schoolMaterials2.visible = false
	$CanvasLayer/board/ingredientes.visible = false
	$CanvasLayer/board/ingredientes2.visible = false
	$CanvasLayer/board/numeros.visible = false
	
func _process(delta):
	if GlobalMGA.completed:
		$CanvasLayer/board/alfabeto.visible = true
	if GlobalSMM.completed:
		$CanvasLayer/board/schoolMaterials.visible = true
		$CanvasLayer/board/schoolMaterials2.visible = true
	if GlobalSM.completed:
		$CanvasLayer/board/ingredientes.visible = true
		$CanvasLayer/board/ingredientes2.visible = true
	if GlobalMGN.completed:
		$CanvasLayer/board/numeros.visible = true

func _input(event):
	if event.is_action_pressed("sair"):
		Transition.fade_to_scene("res://Scenes/tile_map_quarto.tscn")


func _on_sair_pressed():
	Transition.fade_to_scene("res://Scenes/tile_map_quarto.tscn")
