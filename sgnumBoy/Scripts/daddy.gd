extends CharacterBody2D

var SPEED = 30.0

@onready var position_r = $"../../naviagation_positions/position_r"
@onready var position_l = $"../../naviagation_positions/position_l"
@onready var navigation_agent_2d = $NavigationAgent2D
@onready var animation = $AnimatedSprite2D

var target_position_r: Vector2
var target_position_l: Vector2
var current_target: Vector2
var waiting = false

func _ready():
	# Salva as posições globais no início
	target_position_r = position_r.global_position
	target_position_l = position_l.global_position

	current_target = target_position_l
	navigation_agent_2d.set_target_position(current_target)

func _physics_process(delta):
	handle_animation()
	if not waiting:
		if navigation_agent_2d.is_navigation_finished():
			await pause_and_switch_target()
		else:
			var next_point = navigation_agent_2d.get_next_path_position()
			var direction = (next_point - global_position).normalized()
			velocity = direction * SPEED
			move_and_slide()

	

func pause_and_switch_target():
	waiting = true
	velocity = Vector2.ZERO
	move_and_slide()
	await get_tree().create_timer(5.0).timeout

	# Troca o destino
	if current_target == target_position_r:
		current_target = target_position_l
	else:
		current_target = target_position_r

	navigation_agent_2d.set_target_position(current_target)
	waiting = false

func handle_animation():
	if velocity.x > 0:
		animation.play("walk")
		animation.flip_h = false # Direção para a direita
	elif velocity.x < 0:
		animation.play("walk")
		animation.flip_h = true # Direção para a esquerda
	else:
		animation.play("idle") # Estado parado


func _on_area_2d_body_entered(body):
	if body.get_name() == "player":
		SPEED = 0.0
		$key_E.visible = true

func _on_area_2d_body_exited(body):
	if body.get_name() == "player":
		SPEED = 30.0
		$key_E.visible = false
