extends Node2D

@export var interaction: DialogueMetaData
@onready var dialogue_node = $Dialogue

var msgs_to_send = []
var current_msg_index = 0
var dialogue_active = false

func _ready():
	# Carrega todas as mensagens do interaction
	if interaction and interaction.msg_queue.size() > 0:
		msgs_to_send = interaction.msg_queue.duplicate()
		current_msg_index = 0
		dialogue_active = true
		show_next_msg()
	else:
		print("Nenhuma mensagem carregada.")

func _process(delta):
	if dialogue_active and Input.is_action_just_pressed("e"):
		show_next_msg()

func show_next_msg():
	if current_msg_index < msgs_to_send.size():
		dialogue_node.add_msg([msgs_to_send[current_msg_index]])
		current_msg_index += 1
	else:
		dialogue_active = false
		dialogue_node.visible = false
		await wait_for_dialogue_end()
		Transition.fade_to_scene("res://Scenes/tile_map_quarto.tscn")
		
func wait_for_dialogue_end() -> void:
	while dialogue_node.visible:
		await get_tree().process_frame
