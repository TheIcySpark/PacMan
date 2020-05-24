extends CanvasLayer
onready var informacion=$Informacion

func _ready():
	pass # Replace with function body.

func MuertePacman():
	var i=3
	while i>=1:
		if informacion[i].is_visible():
			informacion[i].set_visible(false)
			break
		i-=1
	if i==0: return "Game Over"

func ActualizarPuntaje(puntaje:int):
	$Informacion/Puntaje.text="Puntaje: "+str(puntaje)+" "