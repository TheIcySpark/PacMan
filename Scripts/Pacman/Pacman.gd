extends Area2D
export var velocidad: int
onready var animacion: AnimationPlayer= $Sprite/Animacion
onready var sprite: Sprite= $Sprite
onready var camara: Camera2D= $Camara
onready var timerPowerUp: Timer= $TiempoPowerUp
onready var tween: Tween= $Tween
var direccion: Vector2= Vector2.RIGHT
onready var posActual: Vector2= position
onready var posSig: Vector2= position

func _ready() -> void:
	animacion.play("Inicializar")
	EstablecerLimitesCamara()

func EstablecerLimitesCamara()-> void:
	var limites:Rect2= gMapa.tile.get_used_rect()
	limites.position*= 64
	limites.end*= 64
	camara.limit_top=limites.position.y
	camara.limit_right= limites.end.x
	camara.limit_bottom= limites.end.y
	camara.limit_left= limites.position.x

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

func EstablecerAnimacion(direccionAnterior: Vector2)-> void:
	animacion.play("Caminar")
	if direccion== Vector2.RIGHT:
		sprite.set_rotation_degrees(0)
		sprite.set_flip_h(false)
	elif direccion== Vector2.LEFT:
		sprite.set_rotation_degrees(0)
		sprite.set_flip_h(true)
	elif direccionAnterior==direccion* -1:
		sprite.set_flip_h(not sprite.is_flipped_h())
	elif direccionAnterior==Vector2.RIGHT:
		sprite.set_flip_h(false)
		if direccion==Vector2.UP:
			sprite.set_rotation_degrees(-90)
		elif direccion==Vector2.DOWN:
			sprite.set_rotation_degrees(90)
	elif direccionAnterior==Vector2.LEFT:
		sprite.set_flip_h(true)
		if direccion==Vector2.UP:
			sprite.set_rotation_degrees(90)
		elif direccion==Vector2.DOWN:
			sprite.set_rotation_degrees(- 90)

func ObtenerSiguientePosicion()-> void:
	var nuevaDireccion: Vector2= ObtenerDireccion()
	if nuevaDireccion== Vector2.ZERO: nuevaDireccion= direccion
	if nuevaDireccion== Vector2.ZERO: return
	var direccionAnterior: Vector2= direccion
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
	EstablecerAnimacion(direccionAnterior)

func _physics_process(delta: float) -> void:
	if posActual!= posSig: Mover(delta)
	else: animacion.play("Inicializar")
	ObtenerSiguientePosicion()

func IniciarPowerUp()-> void:
	timerPowerUp.start(10)
	tween.interpolate_property(camara, "zoom", camara.zoom, Vector2(1.5, 1.5), 1, Tween.TRANS_BOUNCE, Tween.EASE_IN, 0)
	tween.start()
	velocidad+= 70


func _on_TiempoPowerUp_timeout() -> void:
	tween.interpolate_property(camara, "zoom", camara.zoom, Vector2(1, 1), 1, Tween.TRANS_BOUNCE, Tween.EASE_IN, 0)
	tween.start()
	velocidad=250
