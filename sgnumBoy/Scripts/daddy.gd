extends CharacterBody2D

@export var interaction: DialogueMetaData

@onready var position_r = $"../../naviagation_positions/position_r"
@onready var position_l = $"../../naviagation_positions/position_l"
@onready var navigation_agent_2d = $NavigationAgent2D
@onready var animation = $AnimatedSprite2D
@onready var dialogue_node = $Dialogue

var SPEED = 90.0
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

	# Garante que o diálogo está invisível no início
	dialogue_node.visible = false


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

	if player_near and Input.is_action_just_pressed("e") and not dialogue_triggered:
		dialogue_triggered = true
		start_dialogue()


func start_dialogue():
	if interaction == null:
		return
	dialogue_node.add_msg(interaction.msg_queue)


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
		$key_E.visible = true
		dialogue_node.visible = false
		dialogue_triggered = false


func _on_area_2d_body_exited(body):
	if body.name == "player":
		player_near = false
		$key_E.visible = false
		dialogue_node.visible = false
