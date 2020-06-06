extends Area2D

func _ready() -> void:
	connect("area_entered", self, "Consumido")

func Consumido(area: Area2D)-> void:
	gJugador.puntaje+=1
	queue_free()