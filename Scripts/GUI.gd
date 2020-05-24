extends CanvasLayer
onready var informacion=$Informacion

func _ready():
	pass # Replace with function body.

func muertePacman():
	var i=3
	while i>=1:
		if informacion[i].is_visible():
			informacion[i].set_visible(false)
			break
		i-=1
	if i==0: return "Game Over"

