extends Label
var puntaje=0 setget set_puntaje, get_puntaje

func set_puntaje(nuevoPuntaje:int):
	$Puntaje.text=str(nuevoPuntaje)+" "

func get_puntaje():
	return puntaje