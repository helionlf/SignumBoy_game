extends Node


var current_phase = "fase_1"
var current_question_index = 0

var quiz_data = {
	#TEM QUE CRIAR UM VETOR COM CADA OPÇÂO PRA CADA FASE
	"fase_1": [
		{"question": "Qual é a capital do Brasil?", "options": ["Rio de Janeiro", "Brasília", "São Paulo"], "correct": 1},
		{"question": "Quantos continentes existem?", "options": ["5", "6", "7"], "correct": 2},
		{"question": "Quem foi Einstein?", "options": ["Cientista", "Cantor", "Escritor"], "correct": 0},
		{"question": "Qual é o maior planeta?", "options": ["Terra", "Júpiter", "Saturno"], "correct": 1}
	],
	"fase_2": [
		{"question": "Qual é a capital da França?", "options": ["Berlim", "Paris", "Madrid"], "correct": 1},
		{"question": "Qual é o menor país?", "options": ["Vaticano", "Mônaco", "San Marino"], "correct": 0},
		{"question": "Quanto é 2+2?", "options": ["3", "4", "5"], "correct": 1},
		{"question": "Qual animal é o rei da selva?", "options": ["Leão", "Tigre", "Elefante"], "correct": 0}
	]
}

func next_level():
	current_question_index = 0
	if current_phase == "fase_1":
		current_phase = "fase_2"
	#TEM QUE CRIAR UM IF PRA CADA FASE
	else:
		print("Fim do quiz!")
		return
