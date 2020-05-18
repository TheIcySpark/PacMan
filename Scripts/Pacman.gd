extends KinematicBody2D
onready var pacman=$"."
onready var animationPlayer=$AnimationPlayer
export var velocidad=1
enum DIRECCION { arriba=0, derecha=1, abajo=2, izquierda=3}
var direccion
func _ready():
	animationPlayer.play("Posicion inicial")

func LeerEntradas():
	if Input.is_action_pressed("ui_up"):
		animationPlayer.play("Caminar arriba")
		direccion=DIRECCION.arriba
	if Input.is_action_pressed("ui_right"):
		animationPlayer.play("Caminar derecha")
		direccion=DIRECCION.derecha
	if Input.is_action_pressed("ui_down"):
		animationPlayer.play("Caminar abajo")
		direccion=DIRECCION.abajo
	if Input.is_action_pressed("ui_left"):
		animationPlayer.play("Caminar izquierda")
		direccion=DIRECCION.izquierda

func Mover():
	if direccion==DIRECCION.arriba:
		move_and_collide(Vector2(0,-velocidad))
	elif direccion==DIRECCION.derecha:
		move_and_collide(Vector2(velocidad,0))
	elif direccion==DIRECCION.abajo:
		move_and_collide(Vector2(0,velocidad))
	elif direccion==DIRECCION.izquierda:
		move_and_collide(Vector2(-velocidad,0))

func _physics_process(delta):
	LeerEntradas()
	Mover()