extends NinePatchRect

@onready var text := $Text
@onready var timer := $Text/Timer

var msg_queue: Array = [
	"Oi tudo bem?",
	"Claro que sim"
]


func _input(event):
	if event is InputEventKey and event.is_action_pressed("E"):
		show_massage()

func add_msg(msg: String) -> void:
	msg_queue.append(msg)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func show_massage() -> void:
	if text.visible_characters < text.text.length():
		text.visible_characters = text.text.length()
		return
	if msg_queue.size() == 0:
		hide()
		return
	text.visible_characters = 0
	
	var msg: String = msg_queue.pop_front()
	text.text = msg
	timer.start()

func _on_timer_timeout():
	if text.visible_characters == text.text.length():
		timer.stop()
	text.visible_characters += 1
