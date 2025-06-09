extends CharacterBody2D

@export var interaction: DialogueMetaData

@onready var position_r = $"../../naviagation_positions/position_r"
@onready var position_l = $"../../naviagation_positions/position_l"
@onready var navigation_agent_2d = $NavigationAgent2D
@onready var animation = $AnimatedSprite2D
@onready var dialogue_node = $Dialogue
@onready var key_E = $key_E

var SPEED = 30.0
var target_position_r: Vector2
var target_position_l: Vector2
var current_target: Vector2
var waiting = false
var player_near = false
var dialogue_triggered = false

func _ready():
	target_position_r = position_r.global_position
	target_position_l = position_l.global_position

	current_target = target_position_l
	navigation_agent_2d.set_target_position(current_target)

	dialogue_node.visible = false

	# Conecta o sinal do diálogo aqui
	dialogue_node.connect("dialogue_finished", Callable(self, "_on_dialogue_finished"))

func _process(delta):
	handle_animation()

	if not waiting:
		if navigation_agent_2d.is_navigation_finished():
			await pause_and_switch_target()
		else:
			var next_point = navigation_agent_2d.get_next_path_position()
			var direction = (next_point - global_position).normalized()
			velocity = direction * SPEED
			move_and_slide()

	# Acionar diálogo com tecla E
	if player_near and Input.is_action_just_pressed("e") and not dialogue_triggered:
		dialogue_triggered = true
		start_dialogue()


func start_dialogue():
	if interaction == null:
		return

	var msgs_to_send = []
	if GlobalSMM.unlocked:
		if interaction.msg_queue.size() >= 4:
			msgs_to_send.append(interaction.msg_queue[2])
			msgs_to_send.append(interaction.msg_queue[3])
	else:
		if interaction.msg_queue.size() >= 2:
			msgs_to_send.append(interaction.msg_queue[0])
			msgs_to_send.append(interaction.msg_queue[1])

	dialogue_node.add_msg(msgs_to_send)

	# Começa a esperar o diálogo terminar
	await wait_for_dialogue_end()

	# Depois que o diálogo termina
	if GlobalSMM.unlocked:
		Transition.fade_to_scene("res://Scenes/school_material_mission.tscn")


func wait_for_dialogue_end() -> void:
	while dialogue_node.visible:
		await get_tree().process_frame

func pause_and_switch_target():
	waiting = true
	velocity = Vector2.ZERO
	move_and_slide()
	await get_tree().create_timer(5.0).timeout

	if current_target == target_position_r:
		current_target = target_position_l
	else:
		current_target = target_position_r

	navigation_agent_2d.set_target_position(current_target)
	waiting = false

func handle_animation():
	if velocity.x > 0:
		animation.play("walk")
		animation.flip_h = false
	elif velocity.x < 0:
		animation.play("walk")
		animation.flip_h = true
	else:
		animation.play("idle")

func _on_area_2d_body_entered(body):
	if body.name == "player":
		player_near = true
		key_E.visible = true
		dialogue_node.visible = false
		dialogue_triggered = false

func _on_area_2d_body_exited(body):
	if body.name == "player":
		player_near = false
		key_E.visible = false
		dialogue_node.visible = false

# Callback do sinal do diálogo
func _on_dialogue_finished():
	if GlobalSMM.unlocked:
		Transition.fade_to_scene("res://Scenes/school_material_mission.tscn")
