extends "res://Scripts/Fantasmas/BaseFantasmas.gd"

func _physics_process(delta: float) -> void:
	if posActual!= posSig: Mover(delta)
	if posActual== posSig:
		if gPacman.powerUp:
			ObtenerSiguientePosicionHuida()
		else:
			var posCuadricula= gMapa.tile.world_to_map(position)
			if gMapa.distancia[posCuadricula.y][posCuadricula.x]<=10:
				ObtenerSiguientePosicionAleatoria()
			else: ObtenerSiguientePosicionPacman()