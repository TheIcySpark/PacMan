extends "res://Scripts/Fantasmas/BaseFantasmas.gd"

func ObtenerDireccion()-> Vector2:
	var posCuadricula: Vector2= gMapa.tile.world_to_map(position)
	var auxPosCuadricula: Vector2
	var disMenor: int= 1000000
	var dirMenor: Vector2= Vector2.ZERO
	var i=0
	while i<4:
		auxPosCuadricula= position
		auxPosCuadricula.x+= gMapa.movs[i][0]
		auxPosCuadricula.y+= gMapa.movs[i][1]
		auxPosCuadricula=gMapa.tile.world_to_map(auxPosCuadricula)
		if gMapa.distancia[auxPosCuadricula.y][auxPosCuadricula.x]< disMenor:
			disMenor= gMapa.distancia[auxPosCuadricula.y][auxPosCuadricula.x]
			dirMenor=posCuadricula.direction_to(auxPosCuadricula)
		i+=1
	return dirMenor

func ObtenerSiguientePosicion()-> void:
	gMapa.Mapear(gPacman.posicion, position)
	direccion= ObtenerDireccion()
	if direccion!= Vector2.ZERO:
		posSig= posActual+ direccion* 64
		animacion.play(mapAnim[direccion])

func _physics_process(delta: float) -> void:
	if posActual!= posSig: Mover(delta)
	if posActual== posSig: ObtenerSiguientePosicion()
