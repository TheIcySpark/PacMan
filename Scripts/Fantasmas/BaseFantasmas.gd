extends KinematicBody2D
onready var dir:= DIRECCION.new(self.position)
onready var puntaje=get_tree().get_nodes_in_group("Puntaje").front()
export var velocidad:int =200

class DIRECCION:
	enum CONSTANTE {sinDireccion=0 ,arriba=1, derecha=2, abajo=3, izquierda=4}
	var direccion:int
	var mapDir=[Vector2.ZERO,Vector2.UP,Vector2.RIGHT,Vector2.DOWN,Vector2.LEFT]
	var posActual: Vector2
	var posSig: Vector2
	func _init(pos:Vector2)->void:
		posActual=pos
		posSig=pos
		direccion=CONSTANTE.sinDireccion
	func CambioDireccionValido()->bool:
		if posActual!=posSig: return false
		else: return true
	func get_vectorDireccion()->Vector2:
		return mapDir[direccion]
	func get_direccionAleatorio()->int:
		return randi()%4+1
	func set_direccionAleatorio()->void:
		direccion=get_direccionAleatorio()
		posSig=posActual+mapDir[direccion]*64
	func get_posicionSiguiente()->Vector2:
		return posSig
	func EnMovimiento()->bool:
		if posActual!=posSig: return true
		else: return false

func _ready():
	randomize()

func Choque(body)->void:
	if body.PowerUpActivado():
		puntaje.set_puntaje(puntaje.get_puntaje()+100)
		self.queue_free()
	else:
		body.Muerte()