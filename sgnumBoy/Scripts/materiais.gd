extends Control


@export var type = ""
@export var pos = Vector2.ZERO

var dragging := false
var offset := Vector2.ZERO

@onready var mochila = $"../mochila"
@onready var mochila_rect = $"../mochila/TextureRect"
var mochila_aberta := false

@onready var completed_label = $"../completed"

func _ready():
	if not GlobalSMM.palavra == "completed":
		completed_label.visible = false
		
	mouse_filter = Control.MOUSE_FILTER_PASS  # garante que os eventos passem
	
func _process(delta):
	if dragging:
		global_position = get_global_mouse_position() - offset
		
	var intersecting = get_global_rect().intersects(mochila.get_global_rect())

	if intersecting and not mochila_aberta:
		mochila_aberta = true
		mochila_rect.texture = load("res://Assets/UI/mochilaAberta.png")
	elif not intersecting and mochila_aberta:
		mochila_aberta = false
		mochila_rect.texture = load("res://Assets/UI/mochila.png")

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				offset = get_global_mouse_position() - global_position
			else:
				dragging = false
				if type != GlobalSMM.palavra:
					$"../../wrong_song".play()
					self.position = pos
				else:
					guardar_material()

func guardar_material():
	if get_global_rect().intersects(mochila.get_global_rect()):
		$"../../correct_song".play()
		queue_free()
		mochila_aberta = false
		mochila_rect.texture = load("res://Assets/UI/mochila.png")
		GlobalSMM.next_level()
		if GlobalSMM.completed:
			completed_label.visible = true
			GlobalSMM.exit()
	else:
		self.position = pos
