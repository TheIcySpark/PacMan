extends "res://Scripts/Pacman/BasePacman.gd"

func Muerte() ->void:
	gJugador.vidas-= 1
	position= posInicial
	idealPosActual= posInicial
	idealPosSig= posInicial
	direccion= Vector2.ZERO
	gJugador.powerUp=false
	set_powerUp(false)

func _on_PowerUpTimer_timeout() -> void:
	set_powerUp(false)
