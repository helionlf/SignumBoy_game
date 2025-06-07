extends Node


@onready var cenario = $CanvasLayer/Control/TextureRect
@onready var completed = $CanvasLayer/Control/completed
@onready var anim = $CanvasLayer/Control/ColorRect/AnimatedSprite2D

func _ready():
	if not GlobalSM.current_phase == "completed":
		for button in cenario.get_children():
			button.connect("pressed", Callable(self, "_on_button_pressed").bind(button))
		load_question()
	else:
		$CanvasLayer/Control/ColorRect.visible = false
		$CanvasLayer/Control/TextureRect/btn_1.visible = false
		$CanvasLayer/Control/TextureRect/btn_2.visible = false
		$CanvasLayer/Control/TextureRect/btn_3.visible = false
		completed.visible = true
		
func _process(delta):
	if GlobalSM.current_phase == "fase_1":
		anim.scale = Vector2(3.74, 3.74)
		anim.position = Vector2(713, 52)
		anim.play("ovos")
	elif GlobalSM.current_phase == "fase_2":
		anim.scale = Vector2(3.74, 3.74)
		anim.position = Vector2(713, 52)
		anim.play("manteiga")
	elif GlobalSM.current_phase == "fase_3":
		anim.scale = Vector2(1.92, 1.92)
		anim.position = Vector2(713, 76)
		anim.play("acucar")
	else:
		anim.scale = Vector2(1.92, 1.92)
		anim.position = Vector2(713, 76)
		anim.play("leite")

func load_question():
	if not GlobalSM.current_phase == "completed":
		var question_data =  GlobalSM.data[GlobalSM.current_phase][0]
		cenario.texture = load(question_data["cenario"])
		
		var options = question_data["options"]
		
		var correct_option = question_data["correct"]
		var correct_index = options.find(question_data["options"][correct_option])
		 
		for i in range(cenario.get_child_count()):
			var button = cenario.get_child(i)
			
			button.modulate = Color(1, 1, 1)
			button.texture_normal = load(options[i]) # Associa o texto ou imagem da opção ao botão
			button.set_meta("is_correct", i == correct_index)  # Define metadados indicando se é a resposta correta
		

func _on_button_pressed(button):
	var is_correct = button.get_meta("is_correct")

	if is_correct:
		print("Resposta correta!")
		$CanvasLayer/Control/correct_song.play()
		button.modulate = Color(0, 1, 0)
		button.disabled = true
		await get_tree().create_timer(0.5).timeout 
		button.disabled = false
	else:
		print("Resposta errada.")
		$CanvasLayer/Control/wrong_song.play()
		button.modulate = Color(1, 0, 0) 
		button.disabled = true
		await get_tree().create_timer(0.5).timeout 
		button.disabled = false
		load_question()
		return
	
	GlobalSM.current_question_index += 1
	if GlobalSM.current_question_index >= GlobalSM.data[GlobalSM.current_phase].size():
		GlobalSM.exit()
	
	load_question()
	
func _input(event):
	if event.is_action_pressed("sair"):
		Transition.fade_to_scene("res://Scenes/tile_map_supermarket.tscn")
