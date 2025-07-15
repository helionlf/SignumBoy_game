extends Area2D


@export var type := "";

var speed = 250.0

func _ready():
	pass # Replace with function body.


func _process(delta):
	position.y += speed * delta
	if position.y > get_viewport_rect().size.y:
		queue_free()


func _on_body_entered(body):
	queue_free()
