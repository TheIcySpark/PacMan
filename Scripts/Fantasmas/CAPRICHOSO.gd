extends "res://Scripts/Fantasmas/BaseFantasmas.gd"
var enojado: bool = false


func _physics_process(delta: float) -> void:
	if posActual!= posSig: Mover(delta)
	if posActual== posSig:
		if not enojado: 
			if not gPacman.powerUp: ObtenerSiguientePosicionAleatoria()
			else: ObtenerSiguientePosicionHuida()
		else:
			if not gPacman.powerUp: ObtenerSiguientePosicionPacman()
			else: ObtenerSiguientePosicionHuida()

func _on_TimerEnojo_timeout() -> void:
	enojado= true
