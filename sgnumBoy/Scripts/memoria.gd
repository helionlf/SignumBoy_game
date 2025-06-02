extends Node2D

@onready var options_container = $CanvasLayer/Control/MenuBar
@onready var label = $CanvasLayer/Control/Label

var first_card = null
var second_card = null
var matches_found = 0
var total_matches = 0

func _ready():
	if not GlobalM.current_phase == "completed":
		label.visible = false
		for button in options_container.get_children():
			button.connect("pressed", Callable(self, "_on_card_pressed").bind(button))
		load_cards()

func load_cards():
	if not GlobalM.current_phase == "completed":
		var cards = []
		var data = GlobalM.memory_data[GlobalM.current_phase]
		
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
			
			var anim_sprite = button.get_node("AnimatedSprite2D")
			anim_sprite.visible = false
			anim_sprite.frames = null
			
			# Guardar os dados da carta
			var card_data = cards[i]
			button.set_meta("card_id", card_data["id"])
			button.set_meta("card_type", card_data["type"])
			button.set_meta("card_path", card_data["path"])
			
			# Mostrar o verso da carta (imagem padrão)
			button.texture_normal = load("res://Assets/UI/cards/back.png")
		
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
		button.texture_normal = load("res://Assets/UI/cards/branco.png")
		anim_sprite.visible = true
		anim_sprite.play()
	
	button.set_meta("revealed", true)
	
	if first_card == null:
		first_card = button
	else:
		second_card = button
		for card in options_container.get_children():
			card.disabled = true
		
		await get_tree().create_timer(3).timeout
		
		if first_card.get_meta("card_id") == second_card.get_meta("card_id"):
			first_card.modulate = Color(0, 1, 0)
			second_card.modulate = Color(0, 1, 0)
			matches_found += 1
			if matches_found >= total_matches:
				GlobalM.next_level()
				options_container.visible = false
				
				if GlobalM.current_phase == "fase_1":
					label.text = "Parabéns, você completou a primeira fase.
					Conclua sua primeira missão para desbloquear a próxima."
				elif GlobalM.current_phase == "fase_2":
					label.text = "Parabéns, você completou o Minigame completo!"
				elif GlobalM.current_phase == "completed":
					label.text = "Parabéns, você completou o minigame!"
				
				label.visible = true
				GlobalM.exit()
				load_cards()
			
		else:
			# Esconder cartas (resetar)
			for card in [first_card, second_card]:
				card.set_meta("revealed", false)
				var anim = card.get_node("AnimatedSprite2D")
				anim.visible = false
				anim.frames = null
				card.texture_normal = load("res://Assets/UI/cards/back.png")
		
		first_card = null
		second_card = null
		
		for card in options_container.get_children():
			card.disabled = false

func _input(event):
	if event.is_action_pressed("sair"):
		Transition.fade_to_scene("res://Scenes/home.tscn")
