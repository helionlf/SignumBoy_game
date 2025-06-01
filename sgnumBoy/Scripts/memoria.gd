extends Node

@onready var options_container = $CanvasLayer/Control/MenuBar
@onready var completed_label = $CanvasLayer/Control/completed

var first_card = null
var second_card = null
var matches_found = 0
var total_matches = 0

func _ready():
	if not GlobalMemoria.current_phase == "completed":
		completed_label.visible = false
		for button in options_container.get_children():
			button.connect("pressed", Callable(self, "_on_card_pressed").bind(button))
		load_cards()

func load_cards():
	if not GlobalMemoria.current_phase == "completed":
		var cards = []
		var data = GlobalMemoria.memory_data[GlobalMemoria.current_phase]
		
		for item in data:
			cards.append(item["pair"][0])
			cards.append(item["pair"][1])
		
		cards.shuffle()
		total_matches = data.size()
		
		for i in range(options_container.get_child_count()):
			var button = options_container.get_child(i)
			button.modulate = Color(1, 1, 1)
			button.texture_normal = load("res://Assets/UI/cards/back.png")
			button.set_meta("card_texture", load(cards[i]))
			button.set_meta("revealed", false)
			button.disabled = false
		
		matches_found = 0
		first_card = null
		second_card = null

func _on_card_pressed(button):
	if button.get_meta("revealed"):
		return
	
	button.texture_normal = button.get_meta("card_texture")
	button.set_meta("revealed", true)
	
	if first_card == null:
		first_card = button
	else:
		second_card = button
		for card in options_container.get_children():
			card.disabled = true
		
		await get_tree().create_timer(0.5).timeout
		
		if first_card.get_meta("card_texture") == second_card.get_meta("card_texture"):
			first_card.modulate = Color(0, 1, 0)
			second_card.modulate = Color(0, 1, 0)
			matches_found += 1
			if matches_found >= total_matches:
				GlobalMemoria.current_question_index += 1
				if GlobalMemoria.current_question_index >= GlobalMemoria.memory_data[GlobalMemoria.current_phase].size():
					GlobalMemoria.next_level()
					if GlobalMemoria.completed:
						completed_label.visible = true
						options_container.visible = false
						GlobalMemoria.exit()
				load_cards()
		else:
			first_card.texture_normal = load("res://Assets/UI/cards/back.png")
			second_card.texture_normal = load("res://Assets/UI/cards/back.png")
			first_card.set_meta("revealed", false)
			second_card.set_meta("revealed", false)
		
		first_card = null
		second_card = null
		
		for card in options_container.get_children():
			card.disabled = false
