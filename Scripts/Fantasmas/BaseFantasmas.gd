extends KinematicBody2D
onready var areaColision: Area2D= $AreaColision
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
	areaColision.connect("body_entered", self, "Choque")

func Choque(body: KinematicBody2D)-> void:
	if gJugador.powerUp:
		gJugador.puntaje+=5
		queue_free()
	else:
		body.Muerte()

func Mover():
	move_and_collide(direccion*get_physics_process_delta_time()*velocidad)
	if posActual.distance_to(position)>=64:
		position=posSig
		posActual=posSig

func ObtenerDireccion()-> void:
	pass

func _physics_process(delta: float) -> void:
	if posActual!=posSig: Mover()
	ObtenerDireccion()

