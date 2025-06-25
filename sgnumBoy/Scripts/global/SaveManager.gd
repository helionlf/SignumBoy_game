extends Node

const SAVE_PATH := "user://save_data.json"
var save_data := {}

func _ready():
	load_save_data()

func save():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file == null:
		push_error("Erro ao abrir arquivo para salvar: " + SAVE_PATH)
		return
	file.store_string(JSON.stringify(save_data))
	file.close()
	print("Dados salvos com sucesso:", save_data)

func load_save_data():
	if not FileAccess.file_exists(SAVE_PATH):
		print("Arquivo de save não existe:", SAVE_PATH)
		return
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file:
		var content = file.get_as_text()
		var parsed = JSON.parse_string(content)
		if typeof(parsed) == TYPE_DICTIONARY:
			save_data = parsed
			print("Save carregado:", save_data)
		else:
			save_data = {}
			push_error("Erro ao carregar JSON: conteúdo inválido")
		file.close()

func reset_save():
	if FileAccess.file_exists(SAVE_PATH):
		DirAccess.remove_absolute(SAVE_PATH)
		save_data = {}
		print("Progresso resetado!")
	else:
		print("Nenhum save encontrado para apagar.")
