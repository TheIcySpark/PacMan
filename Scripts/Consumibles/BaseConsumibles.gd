extends Area2D

func _ready() -> void:
	connect("body_entered", self, "Consumido")

func Consumido(body: KinematicBody2D)-> void:
	gJugador.puntaje+=1
	queue_free()