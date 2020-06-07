extends Area2D
export var velocidad: int
onready var animacion: AnimationPlayer= $Sprite/Animacion
var direccion: Vector2= Vector2.ZERO
onready var posActual: Vector2= position
onready var posSig: Vector2= position

func _ready() -> void:
	animacion.play("Inicializar")

func ObtenerDireccion()-> Vector2:
	if Input.is_action_pressed("ui_arriba"): return Vector2.UP
	elif Input.is_action_pressed("ui_derecha"): return Vector2.RIGHT
	elif Input.is_action_pressed("ui_izquierda"): return Vector2.LEFT
	elif Input.is_action_pressed("ui_abajo"): return Vector2.DOWN
	else: return Vector2.ZERO

func Mover(delta: float)-> void:
	position+=direccion* velocidad* delta
	if posActual.distance_to(position)>=64:
		position= posSig
		posActual= posSig

func ObtenerSiguientePosicion()-> void:
	var nuevaDireccion: Vector2= ObtenerDireccion()
	if nuevaDireccion== Vector2.ZERO: nuevaDireccion= direccion
	if nuevaDireccion== Vector2.ZERO: return
	if posActual== posSig:
		if gMapa.PosicionValida(posActual+ nuevaDireccion* 64):
			posSig= posActual+ nuevaDireccion* 64
			direccion= nuevaDireccion
		else:
			if gMapa.PosicionValida(posActual+ direccion* 64):
				posSig= posActual+ direccion* 64
	elif posSig+ nuevaDireccion* 64== posActual:
		#Cambio de direccion valido
		var intercambio: Vector2= posActual
		posSig= posActual
		posActual= intercambio
		direccion= nuevaDireccion

func _physics_process(delta: float) -> void:
	if posActual!= posSig: Mover(delta)
	else: animacion.play("Inicializar")
	ObtenerSiguientePosicion()



