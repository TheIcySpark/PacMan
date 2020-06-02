extends "res://Scripts/Pacman/BasePacman.gd"


func Muerte():
	gJugador.vidas-= 1
	position= posInicial
	idealPosActual= posInicial
	idealPosSig= posInicial
	direccion= Vector2.ZERO