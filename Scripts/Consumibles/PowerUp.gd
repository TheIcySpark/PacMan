extends "res://Scripts/Consumibles/BaseConsumibles.gd"

func Consumido(area: Area2D)-> void:
	gJugador.puntaje+= 3
	area.powerUp= true
	queue_free()