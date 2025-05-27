extends NinePatchRect

@onready var text := $RichTextLabel
@onready var timer := $Timer

var msg_queue: Array = [
	'Oi',
	'Vamos aprender libras, ufdnauifhiuhdiasuhfuiahsufiahfuiadhfuiashiufhafiuhafihauifas',
	"Voce deve estar se perguntando como voce vai aprender libras, uma forma de linguagem tao complexa",
	]
var is_showing_message := false

func _input(event):
	if event is InputEventKey and event.is_action_pressed("E"):
		if is_showing_message and text.visible_characters < text.text.length():
			# Pula a digitação
			text.visible_characters = text.text.length()
			timer.stop()
		else:
			show_massage()

func add_msg(msg: Array) -> void:
	if not visible:
		show()
		
	msg_queue.append(msg)
	show_massage()


func show_massage() -> void:
	if msg_queue.size() == 0:
		hide()
		is_showing_message = false
		return
	text.visible_characters = 0
	var msg: String = msg_queue.pop_front()
	text.text = msg
	is_showing_message = true
	timer.start()

func _on_timer_timeout():
	if text.visible_characters >= text.text.length():
		timer.stop()
	else:
		text.visible_characters += 1
