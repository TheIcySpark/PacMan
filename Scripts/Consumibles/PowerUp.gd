extends "res://Scripts/Consumibles/BaseConsumibles.gd"

func Consumido(area: Area2D)-> void:
	area.IniciarPowerUp()
	queue_free()
