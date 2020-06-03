extends KinematicBody2D
export (int) var velocidad
onready var posInicial: Vector2= self.position
onready var deteccionObstaculos: RayCast2D= $DeteccionObstaculos
onready var animacion: AnimationPlayer= $Sprite/Animacion
onready var timerPowerUp: Timer= $PowerUpTimer
onready var camara: Camera2D= $CamaraPacMan
var mapAnimacion: Dictionary= {Vector2.UP: "Caminar arriba", Vector2.RIGHT: "Caminar derecha", Vector2.DOWN: "Caminar abajo",
							Vector2.LEFT: "Caminar izquierda"}
var tamTile: int= 64
var powerUp: bool= false setget set_powerUp, get_powerUp
var direccion: Vector2= Vector2.ZERO
onready var idealPosActual: Vector2= self.position
onready var idealPosSig: Vector2= self.position

func set_powerUp(pU: bool)-> void:
	if pU==true:
		if timerPowerUp.get_time_left()<10: camara.ZoomOut()
		timerPowerUp.start(10)
		gJugador.powerUp=true
	else:
		timerPowerUp.stop()
		gJugador.powerUp=false
		camara.ZoomIn()

func get_powerUp()-> bool:
	return powerUp

func _ready() -> void:
	animacion.play("Posicion inicial")

func LeerDireccion()->Vector2:
	#Lee la direccion actual del teclado
	if Input.is_action_pressed("ui_arriba"): return Vector2.UP
	elif Input.is_action_pressed("ui_derecha"): return Vector2.RIGHT
	elif Input.is_action_pressed("ui_abajo"): return Vector2.DOWN
	elif Input.is_action_pressed("ui_izquierda"): return Vector2.LEFT
	else: return Vector2.ZERO

func Mover()-> void:
	#Mueve una posicion en la direccion establecida
	move_and_collide(direccion*velocidad*get_physics_process_delta_time())
	if get_position().distance_to(idealPosActual)>=tamTile:
		set_position(idealPosSig)
		idealPosActual=idealPosSig


func CalcularSiguientePosicion()-> void:
	#Establece la direccion, posicion actual y siguiente
	var nuevaDireccion=LeerDireccion()
	if nuevaDireccion==Vector2.ZERO: nuevaDireccion=direccion
	if nuevaDireccion==Vector2.ZERO: return
	if (idealPosActual!=idealPosSig and idealPosSig+nuevaDireccion*tamTile==idealPosActual and
	deteccionObstaculos.PosicionLibre(nuevaDireccion*tamTile)):
		direccion=nuevaDireccion
		var temp: Vector2= idealPosSig
		idealPosSig= idealPosActual
		idealPosActual= temp
		animacion.play(mapAnimacion[direccion])
	elif idealPosActual==idealPosSig:
		if deteccionObstaculos.PosicionLibre(nuevaDireccion*tamTile):
			direccion=nuevaDireccion
			idealPosSig=idealPosActual+direccion*tamTile
			animacion.play(mapAnimacion[direccion])
		elif direccion!=Vector2.ZERO and deteccionObstaculos.PosicionLibre(direccion*tamTile):
			idealPosSig=idealPosActual+direccion*tamTile
			animacion.play(mapAnimacion[direccion])
		else:
			direccion=Vector2.ZERO

func _physics_process(delta: float) -> void:
	if direccion!=Vector2.ZERO: Mover()
	CalcularSiguientePosicion()
