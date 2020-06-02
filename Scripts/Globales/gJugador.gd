extends Node
var puntaje: int= 0 setget set_puntaje, get_puntaje
var vidas: int= 3 setget set_vidas, get_vidas
var powerUp: bool= false


func set_puntaje(nuevoPuntaje: int)-> void:
	puntaje=nuevoPuntaje

func get_puntaje()-> int:
	return puntaje

func set_vidas(nuevasVidas: int)-> void:
	vidas=nuevasVidas
	if vidas==0:
		get_tree().reload_current_scene()
		vidas=3
		puntaje=0

func get_vidas()-> int:
	return vidas