extends "res://Scripts/MovimientoPacMan.gd"

func _ready():
	animationPlayer.play(mapAnim[direccion])
