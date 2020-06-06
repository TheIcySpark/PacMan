extends Area2D
onready var detectarObstaculos: RayCast2D= $DetectarObstaculos
export var velocidad: int
onready var posActual: Vector2= self.position
onready var posSig: Vector2= self.position
onready var animacion: AnimationPlayer= $Sprite/AnimationPlayer
var direccion: Vector2= Vector2.ZERO
var mapAnimacion: Dictionary= {0: 0, Vector2.UP: "Caminar arriba", Vector2.RIGHT: "Caminar derecha", 
				Vector2.DOWN: "Caminar abajo", Vector2.LEFT:"Caminar izquierda"}

func _ready()-> void:
	randomize()
	connect("area_entered", self, "Choque")

func Choque(area: Area2D)-> void:
	if gJugador.powerUp:
		gJugador.puntaje+=5
		queue_free()
	else:
		area.Muerte()

func Mover(delta: float):
	position+= direccion* velocidad* delta
	if posActual.distance_to(position)>=64:
		position=posSig
		posActual=posSig

func ObtenerDireccion()-> void:
	pass

func _physics_process(delta: float) -> void:
	if posActual!=posSig: Mover(delta)
	ObtenerDireccion()

