extends KinematicBody2D
onready var pacman=$"."
onready var animationPlayer=$AnimationPlayer
onready var rayCast=$RayCast2D
export var velocidad=128
enum DIRECCION {sinDireccion=0 ,arriba=1, derecha=2, abajo=3, izquierda=4}
var mapDir=[Vector2.ZERO,Vector2.UP,Vector2.RIGHT,Vector2.DOWN,Vector2.LEFT]
var mapAnim=["Posicion inicial","Caminar arriba","Caminar derecha","Caminar abajo","Caminar izquierda"]
var direccion=DIRECCION.sinDireccion
var tamTile=64
var posActual:=Vector2(position.x,position.y)
var posSig:=Vector2(position.x,position.y)

func _ready():
	animationPlayer.play(mapAnim[direccion])

func ObtenerDireccion():
	if Input.is_action_pressed("ui_up"):
		direccion=DIRECCION.arriba
	if Input.is_action_pressed("ui_right"):
		direccion=DIRECCION.derecha
	if Input.is_action_pressed("ui_down"):
		direccion=DIRECCION.abajo
	if Input.is_action_pressed("ui_left"):
		direccion=DIRECCION.izquierda

func PosicionLibre(pos)->bool:
	rayCast.set_cast_to(pos)
	rayCast.force_raycast_update()
	if rayCast.is_colliding(): return false
	return true


func Mover():
	if posActual!=posSig:
		move_and_collide(mapDir[direccion]*get_physics_process_delta_time()*velocidad)
		if pacman.position.distance_to(posActual)>=tamTile: pacman.position=posSig
	if pacman.position==posSig:
		var dirAnterior=direccion
		ObtenerDireccion()
		posActual=posSig
		if PosicionLibre(mapDir[direccion]*tamTile):
			posSig=posActual+mapDir[direccion]*tamTile
			animationPlayer.play(mapAnim[direccion])
		else:
			direccion=dirAnterior
			if PosicionLibre(mapDir[direccion]*tamTile):
				posSig=posActual+mapDir[direccion]*tamTile
				animationPlayer.play(mapAnim[direccion])
			else: posSig=posActual
	else:
		var dirAnterior=direccion
		ObtenerDireccion()
		if posSig+mapDir[direccion]*tamTile==posActual:
			var aux
			aux=posActual
			posActual=posSig
			posSig=aux
			animationPlayer.play(mapAnim[direccion])
		else: direccion=dirAnterior

func _physics_process(delta):
	Mover()