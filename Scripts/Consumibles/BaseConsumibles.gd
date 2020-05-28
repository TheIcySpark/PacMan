extends Area2D
onready var puntaje=get_tree().get_nodes_in_group("Puntaje").front()

func Consumido(puntos: int)->void:
	puntaje.set_puntaje(puntaje.get_puntaje()+puntos)
	queue_free()
