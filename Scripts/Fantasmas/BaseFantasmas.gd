extends Area2D
export var velocidad: int
onready var animacion: AnimationPlayer= $Sprite/Animacion
onready var posActual: Vector2= position
onready var posSig: Vector2= position
var direccion: Vector2= Vector2.ZERO
var mapAnim: Dictionary= {Vector2.ZERO: "Caminar arriba", Vector2.UP: "Caminar arriba", 
						Vector2.RIGHT: "Caminar derecha", Vector2.DOWN: "Caminar derecha", Vector2.LEFT: "Caminar izquierda" }

func _ready() -> void:
	connect("area_entered", self, "Choque")

func Choque(area: Area2D):
	if gPacman.powerUp:
		queue_free()

func Mover(delta: float)-> void:
	position+= direccion* velocidad* delta
	if posActual.distance_to(position)>=64:
		position= posSig
		posActual= posSig

func ObtenerDireccionPacman()-> Vector2:
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

func ObtenerSiguientePosicionPacman()-> void:
	direccion= ObtenerDireccionPacman()
	if direccion!= Vector2.ZERO:
		posSig= posActual+ direccion* 64
		animacion.play(mapAnim[direccion])

func ObtenerDireccionHuida():
	var posCuadricula: Vector2= gMapa.tile.world_to_map(position)
	var auxPosCuadricula: Vector2
	var disMenor: int= 0
	var dirMenor: Vector2= Vector2.ZERO
	var i=0
	while i<4:
		auxPosCuadricula= position
		auxPosCuadricula.x+= gMapa.movs[i][0]
		auxPosCuadricula.y+= gMapa.movs[i][1]
		auxPosCuadricula=gMapa.tile.world_to_map(auxPosCuadricula)
		if gMapa.distancia[auxPosCuadricula.y][auxPosCuadricula.x]!=1000000 and  gMapa.distancia[auxPosCuadricula.y][auxPosCuadricula.x]> disMenor:
			disMenor= gMapa.distancia[auxPosCuadricula.y][auxPosCuadricula.x]
			dirMenor=posCuadricula.direction_to(auxPosCuadricula)
		i+=1
	return dirMenor

func ObtenerSiguientePosicionHuida():
	direccion= ObtenerDireccionHuida()
	if direccion!= Vector2.ZERO:
		posSig= posActual+ direccion* 64
		animacion.play(mapAnim[direccion])

func _physics_process(delta: float) -> void:
	if gPacman.powerUp:
		animacion.play("Caminar vulnerable")