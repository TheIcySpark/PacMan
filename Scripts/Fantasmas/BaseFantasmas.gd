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

func _physics_process(delta: float) -> void:
	if gPacman.powerUp:
		animacion.play("Caminar vulnerable")