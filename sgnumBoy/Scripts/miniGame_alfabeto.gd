extends Node


@onready var current_world = $CanvasLayer/Control/TextureRect
@onready var options_container = $CanvasLayer/Control/OptionsContainer
@onready var completed_label = $CanvasLayer/Control/completed

func _ready():
	if not GlobalMGA.current_phase == "completed":
		completed_label.visible = false
		for button in options_container.get_children():
			button.connect("pressed", Callable(self, "_on_button_pressed").bind(button))
		load_question()
	

func load_question():
	if not GlobalMGA.current_phase == "completed":
		var question_data =  GlobalMGA.quiz_data[GlobalMGA.current_phase][GlobalMGA.current_question_index]
		current_world.texture = load(question_data["question"])
		
		var options = question_data["options"].duplicate()
		options.shuffle()
		
		var correct_option = question_data["correct"]
		var shuffled_correct_index = options.find(question_data["options"][correct_option])
		 
		for i in range(options_container.get_child_count()):
			var button = options_container.get_child(i)
			
			button.modulate = Color(1, 1, 1)
			button.texture_normal = load(options[i]) # Associa o texto ou imagem da opção ao botão
			button.set_meta("is_correct", i == shuffled_correct_index)  # Define metadados indicando se é a resposta correta
		

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
	
	GlobalMGA.current_question_index += 1
	if GlobalMGA.current_question_index >= GlobalMGA.quiz_data[GlobalMGA.current_phase].size():
		GlobalMGA.next_level()
		
		if GlobalMGA.completed:
			completed_label.visible = true
			$CanvasLayer/Control/OptionsContainer.visible = false
			$CanvasLayer/Control/TextureRect.visible = false
			GlobalMGA.exit()
	
	load_question()
