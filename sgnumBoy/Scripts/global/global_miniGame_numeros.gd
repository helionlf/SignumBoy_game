extends Node


var completed = false
var acertos = 0

func marcar_acerto():
	acertos += 1
	if acertos >= 10:
		completed = true

func reset():
	completed = false
	acertos = 0
