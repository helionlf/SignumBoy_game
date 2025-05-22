extends CharacterBody2D

@export var Interaction: DialogueMetaData

@onready var Dialogue_box = $Dialogue
@onready var AnimationChar = $AnimatedSprite2D

var SPEED = 30.0
var player_near = false
var dialogue_triggered = false

func _ready():
	Dialogue_box.visible = false

func _physics_process(delta):
	if player_near and Input.is_action_just_pressed("E") and not dialogue_triggered:
		dialogue_triggered = true
		start_dialogue()

func start_dialogue():
	if Interaction == null:
		return
	Dialogue_box.add_msg(Interaction.msg_queue)

func _on_interaction_shape_body_entered(body):
	if body.name == "player":
		player_near = true
		$KeyE.visible = true
		Dialogue_box.visible = false
		dialogue_triggered = false


func _on_interaction_shape_body_exited(body):
	if body.name == "player":
		player_near = false
		$KeyE.visible = false
		Dialogue_box.visible = false
