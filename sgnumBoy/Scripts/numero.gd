extends Control

@export var pos_inicial : Vector2
@export var posicao_alvo : Vector2  # posição onde esse número deve ser solto
@export var tolerancia := 40.0      # distância máxima para "encaixar"

var dragging := false
var offset := Vector2.ZERO

func _ready():
	position = pos_inicial
	mouse_filter = Control.MOUSE_FILTER_PASS
	GlobalMGN.acertos = 0

func _process(_delta):
	if dragging:
		global_position = get_global_mouse_position() - offset

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
			offset = get_global_mouse_position() - global_position
		else:
			dragging = false
			# Verifica se está perto o suficiente da posição-alvo
			if global_position.distance_to(posicao_alvo) <= tolerancia:
				global_position = posicao_alvo  # Encaixa
				GlobalMGN.marcar_acerto()
			else:
				position = pos_inicial

func _input(event):
	if event.is_action_pressed("sair"):
		Transition.fade_to_scene("res://Scenes/tile_map_scholl.tscn")


func _on_sair_pressed():
	Transition.fade_to_scene("res://Scenes/tile_map_scholl.tscn")
