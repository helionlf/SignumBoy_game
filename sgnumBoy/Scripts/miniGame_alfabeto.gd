extends Node


@onready var current_world = $CanvasLayer/Control/TextureRect

func _ready():
	load_question()

func _process(delta):
	pass

func load_question():
	var question_data =  GlobalMGA.quiz_data[GlobalMGA.current_phase][GlobalMGA.current_question_index]
	current_world.texture = load(question_data["question"])
	
	var options = question_data["options"].duplicate()
	options.shuffle()
	
	var correct_option = question_data["correct"]
	var shuffled_correct_index = options.find(question_data["options"][correct_option])
	 
	for i in range($CanvasLayer/Control/OptionsContainer.get_child_count()):
		var button = $CanvasLayer/Control/OptionsContainer.get_child(i)
		
		button.texture_normal = load("res://Assets/teste.jpg") # Associa o texto ou imagem da opção ao botão
		button.set_meta("is_correct", i == shuffled_correct_index)  # Define metadados indicando se é a resposta correta
		button.connect("pressed", Callable(self, "_on_button_pressed").bind(button))



func _on_button_pressed(button):
	var is_correct = button.get_meta("is_correct")

	if is_correct:
		print("Resposta correta!")
	else:
		print("Resposta errada.")
	
	GlobalMGA.current_question_index += 1
	if GlobalMGA.current_question_index >= GlobalMGA.quiz_data[GlobalMGA.current_phase].size():
		GlobalMGA.next_level()
	
	load_question()
