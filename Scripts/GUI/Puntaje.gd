extends Label
var puntaje:int =0 setget set_puntaje, get_puntaje

func set_puntaje(nuevoPuntaje:int):
	self.set_text("Puntaje: "+str(nuevoPuntaje)+" ")
	puntaje=nuevoPuntaje

func get_puntaje():
	return puntaje