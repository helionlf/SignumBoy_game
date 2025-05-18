extends Control

var dragging := false
var offset := Vector2.ZERO

func _ready():
	mouse_filter = Control.MOUSE_FILTER_PASS  # garante que os eventos passem
	
func _process(delta):
	if dragging:
		global_position = get_global_mouse_position() - offset

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				offset = get_global_mouse_position() - global_position
			else:
				dragging = false
