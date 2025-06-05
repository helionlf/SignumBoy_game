extends CharacterBody2D


const SPEED = 38.0
var direction = "south"

func _physics_process(delta):
	_move()
	_update_animation()
	move_and_slide()

func _move():
	var direction: Vector2 = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	if direction:
		velocity = direction.normalized() * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		

func _update_animation():
	if velocity.length() > 0:
		if velocity.x > 0:
			$animation.play("walk")
			$animation.flip_h = false
			direction = "east"
		elif velocity.x < 0:
			$animation.play("walk")
			$animation.flip_h = true
			direction = "west"
		elif velocity.y > 0:
			$animation.play("down")
			direction = "south"
		elif velocity.y < 0:
			$animation.play("up")
			direction = "north"
	else:
		if direction == "east":
			$animation.play("idle_ew")
			$animation.flip_h = false
		elif direction == "west":
			$animation.play("idle_ew")
			$animation.flip_h = true
		elif direction == "south":
			$animation.play("idle_s")
		else:
			$animation.play("idle_n")


