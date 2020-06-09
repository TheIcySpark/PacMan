extends "res://Scripts/Fantasmas/BaseFantasmas.gd"

func _physics_process(delta: float) -> void:
	if posActual!= posSig: Mover(delta)
	if posActual== posSig: 
		if not gPacman.powerUp: ObtenerSiguientePosicionPacman()
		else: ObtenerSiguientePosicionHuida()
