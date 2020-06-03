extends "res://Scripts/Fantasmas/BaseFantasmas.gd"
var mapDireccion: Dictionary= {0: 0, 1: Vector2.UP, 2: Vector2.RIGHT, 3: Vector2.DOWN, 4: Vector2.LEFT}

func ObtenerDireccion()-> void:
	if posActual!=posSig: return
	direccion=mapDireccion[randi()%4+1]
	if detectarObstaculos.PosicionLibre(direccion*64):
		posSig=posActual+direccion*64
		if gJugador.powerUp: animacion.play("Caminar vulnerable")
		else: animacion.play(mapAnimacion[direccion])