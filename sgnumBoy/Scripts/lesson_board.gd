extends Node2D


func _ready():
	$CanvasLayer/board.visible = false


func _process(delta):
	if GlobalMGA.completed:
		$CanvasLayer/board.visible = false
		
