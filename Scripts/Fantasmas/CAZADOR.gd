extends "res://Scripts/Fantasmas/BaseFantasmas.gd"
var cuadricula: Array= []
var distancia: Array= []
var movs: Array= [[64, 0], [0, 64], [-64, 0], [0, -64]]

func _ready() -> void:
	CrearCuadricula()

func CrearCuadricula()-> void:
	var limites: Rect2= gMapa.tile.get_used_rect()
	var fila: Array= []
	var filaD: Array= []
	limites.position*= 64
	limites.end*= 64
	var i= limites.position.y
	var j
	while i<limites.end.y:
		j=limites.position.x
		while j<limites.end.x:
			fila.append(gMapa.tile.get_cellv(gMapa.tile.world_to_map(Vector2(j, i))))
			filaD.append(1000000)
			j+=64
		cuadricula.append(fila)
		distancia.append(filaD)
		fila=[]
		filaD=[]
		i+=64

func InicializarDistancias()-> void:
	var i=0
	var j
	while i<distancia.size():
		j=0
		while j<distancia[i].size():
			distancia[i][j]=1000000
			j+=1
		i+=1

func Mapear():
	var cola: Array= []
	var actual: Vector2
	var nuevo: Vector2
	var i
	var posNuevo: Vector2
	var posActual: Vector2
	actual= gMapa.PosicionPacman()
	posActual= gMapa.tile.world_to_map(actual)
	distancia[posActual.y][posActual.x]= 0
	cola.push_back(actual)
	while not cola.empty():
		actual= cola.front()
		cola.pop_front()
		posActual= gMapa.tile.world_to_map(actual)
		i=0
		while i<4:
			nuevo= actual
			nuevo.x+= movs[i][0]
			nuevo.y+= movs[i][1]
			posNuevo= gMapa.tile.world_to_map(nuevo)
			if distancia[posNuevo.y][posNuevo.x]==1000000 and cuadricula[posNuevo.y][posNuevo.x]==1 :
				distancia[posNuevo.y][posNuevo.x]=distancia[posActual.y][posActual.x]+1
				cola.push_back(nuevo)
				if nuevo==position: return
			i+=1

func ObtenerDireccion()-> Vector2:
	var posCuadricula: Vector2= gMapa.tile.world_to_map(position)
	var auxPosCuadricula: Vector2
	var disMenor: int= 1000000
	var dirMenor: Vector2= Vector2.ZERO
	var i=0
	while i<4:
		auxPosCuadricula= position
		auxPosCuadricula.x+= movs[i][0]
		auxPosCuadricula.y+= movs[i][1]
		auxPosCuadricula=gMapa.tile.world_to_map(auxPosCuadricula)
		if distancia[auxPosCuadricula.y][auxPosCuadricula.x]< disMenor:
			disMenor= distancia[auxPosCuadricula.y][auxPosCuadricula.x]
			dirMenor=posCuadricula.direction_to(auxPosCuadricula)
		i+=1
	return dirMenor

func ObtenerSiguientePosicion()-> void:
	InicializarDistancias()
	Mapear()
	direccion= ObtenerDireccion()
	if direccion!= Vector2.ZERO:
		posSig= posActual+ direccion* 64
		animacion.play(mapAnim[direccion])

func _physics_process(delta: float) -> void:
	if posActual!= posSig: Mover(delta)
	if posActual== posSig: ObtenerSiguientePosicion()





