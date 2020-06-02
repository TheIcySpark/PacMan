extends "res://Scripts/Consumibles/BaseConsumibles.gd"

func Consumido(body: KinematicBody2D)-> void:
	gJugador.puntaje+= 3
	body.powerUp= true
	queue_free()