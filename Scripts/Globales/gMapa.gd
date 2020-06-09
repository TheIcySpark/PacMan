extends Node
var tile: TileMap
var cuadricula: Array= []
var distancia: Array= []
var movs: Array= [[64, 0], [0, 64], [-64, 0], [0, -64]]
var actualizacion: Timer= Timer.new()

signal Mapear(Posicion)

func _ready() -> void:
	connect("Mapear", self, "Mapear")
	actualizacion.connect("timeout", self, "ActualizarMapa")
	actualizacion.start(1)
	add_child(actualizacion)

func ActualizarMapa():
	emit_signal("Mapear", gPacman.posicion)

func PosicionValida(pos: Vector2)-> bool:
	if tile.get_cellv(tile.world_to_map(pos))== 1: return true
	else: return false


func CrearCuadricula()-> void:
	cuadricula= []
	distancia= []
	var limites: Rect2= tile.get_used_rect()
	var fila: Array= []
	var filaD: Array= []
	limites.position*= 64
	limites.end*= 64
	var i= limites.position.y
	var j
	while i<limites.end.y:
		j=limites.position.x
		while j<limites.end.x:
			fila.append(tile.get_cellv(tile.world_to_map(Vector2(j, i))))
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

func Mapear(posA: Vector2)-> void:
	InicializarDistancias()
	var cola: Array= []
	var actual: Vector2
	var nuevo: Vector2
	var i
	var posNuevo: Vector2
	var posActual: Vector2
	actual= posA
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
			i+=1