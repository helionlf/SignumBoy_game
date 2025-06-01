extends Node2D

@onready var options_container = $CanvasLayer/Control/MenuBar
#@onready var completed_label = $CanvasLayer/Control/completed

var first_card = null
var second_card = null
var matches_found = 0
var total_matches = 0

func _ready():
	if not GlobalM.current_phase == "completed":
		#completed_label.visible = false
		for button in options_container.get_children():
			button.connect("pressed", Callable(self, "_on_card_pressed").bind(button))
		load_cards()

func load_cards():
	if not GlobalM.current_phase == "completed":
		var cards = []
		var data = GlobalM.memory_data[GlobalM.current_phase]
		
		#for item in data:
			#cards.append(item["pair"][0])
			#cards.append(item["pair"][1])
		# Para cada par, adiciona as duas cartas no baralho
		for item in data:
			var pair = item["pair"]
			for card_data in pair:
				cards.append(card_data)
		
		cards.shuffle()
		total_matches = data.size()
		
		for i in range(options_container.get_child_count()):
			var button = options_container.get_child(i)
			button.modulate = Color(1, 1, 1)
			button.disabled = false
			button.set_meta("revealed", false)
			#var button = options_container.get_child(i)
			#button.modulate = Color(1, 1, 1)
			#button.texture_normal = load("res://Assets/UI/cards/abelha.png")
			
			
			var anim_sprite = button.get_node("AnimatedSprite2D")
			anim_sprite.visible = false
			anim_sprite.frames = null
			
			#var card_data = cards[i]
			#button.set_meta("card_texture", load(card_data["texture"]))
			#button.set_meta("card_id", card_data["id"])
			#button.set_meta("revealed", false)
			#button.disabled = false
			
			# Guardar os dados da carta
			var card_data = cards[i]
			button.set_meta("card_id", card_data["id"])
			button.set_meta("card_type", card_data["type"])
			button.set_meta("card_path", card_data["path"])
			
			# Mostrar o verso da carta (imagem padrão)
			button.texture_normal = load("res://Assets/UI/cards/abelha.png")
			
			#button.set_meta("card_texture", load(cards[i]))
			#button.set_meta("revealed", false)
			#button.disabled = false
		
		matches_found = 0
		first_card = null
		second_card = null

func _on_card_pressed(button):
	if button.get_meta("revealed"):
		return
	
	var card_type = button.get_meta("card_type")
	var card_path = button.get_meta("card_path")
	var anim_sprite = button.get_node("AnimatedSprite2D")
	
	if card_type == "texture":
		# Mostrar a textura da carta
		button.texture_normal = load(card_path)
		anim_sprite.visible = false
		anim_sprite.frames = null
	elif card_type == "animation":
		# Mostrar a animação
		anim_sprite.frames = load(card_path)
		anim_sprite.visible = true
		anim_sprite.play()
		# esconder a textura do botão para não sobrepor
		button.texture_normal = null
	
	button.set_meta("revealed", true)
	
	#button.texture_normal = button.get_meta("card_texture")
	#button.set_meta("revealed", true)
	
	if first_card == null:
		first_card = button
	else:
		second_card = button
		for card in options_container.get_children():
			card.disabled = true
		
		await get_tree().create_timer(0.5).timeout
		
		#if first_card.get_meta("card_texture") == second_card.get_meta("card_texture"):
		if first_card.get_meta("card_id") == second_card.get_meta("card_id"):
			first_card.modulate = Color(0, 1, 0)
			second_card.modulate = Color(0, 1, 0)
			matches_found += 1
			if matches_found >= total_matches:
				GlobalM.current_question_index += 1
				if GlobalM.current_question_index >= GlobalM.memory_data[GlobalM.current_phase].size():
					GlobalM.next_level()
					if GlobalM.completed:
						#completed_label.visible = true
						options_container.visible = false
						GlobalM.exit()
				load_cards()
		else:
			# Esconder cartas (resetar)
			for card in [first_card, second_card]:
				card.set_meta("revealed", false)
				var anim = card.get_node("AnimatedSprite2D")
				anim.visible = false
				anim.frames = null
				card.texture_normal = load("res://Assets/UI/cards/abelha.png")
			#first_card.texture_normal = load("res://Assets/UI/cards/back.png")
			#second_card.texture_normal = load("res://Assets/UI/cards/back.png")
			#first_card.set_meta("revealed", false)
			#second_card.set_meta("revealed", false)
		
		first_card = null
		second_card = null
		
		for card in options_container.get_children():
			card.disabled = false
