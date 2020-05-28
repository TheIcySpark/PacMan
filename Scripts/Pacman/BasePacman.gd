extends KinematicBody2D
onready var dir=MOVIMIENTO.new(self.position)
onready var vidas=get_tree().get_nodes_in_group("Informacion").front()
export var velocidad=128
export var posInicial:=Vector2(0,0)

class MOVIMIENTO:
	enum CONSTANTE {sinDireccion=0 ,arriba=1, derecha=2, abajo=3, izquierda=4}
	var direccion:int
	var mapDir=[Vector2.ZERO,Vector2.UP,Vector2.RIGHT,Vector2.DOWN,Vector2.LEFT]
	var mapAnim=["Posicion inicial","Caminar arriba","Caminar derecha","Caminar abajo","Caminar izquierda"]
	var posActual: Vector2
	var posSig: Vector2
	func _init(pos: Vector2):
		direccion=CONSTANTE.sinDireccion
		posActual=pos
		posSig=pos
	func set_direccion(dir: int)->void:
		direccion=dir
		set_posSig()
	func SinDireccion()-> bool:
		if posActual==posSig: return true
		else: return false
	func get_direccion()-> Vector2:
		return mapDir[direccion]
	func get_posActual()-> Vector2:
		return posActual
	func IgualarPosiciones(vec: Vector2)-> void:
		posActual=vec
		posSig=vec
	func set_posSig():
		posSig=posActual+mapDir[direccion]*64
	func get_animacion()->String:
		return mapAnim[direccion]
	func ObtenerDireccion():
		if Input.is_action_pressed("ui_up"): return CONSTANTE.arriba
		elif Input.is_action_pressed("ui_right"): return CONSTANTE.derecha
		elif Input.is_action_pressed("ui_down"): return CONSTANTE.abajo
		elif Input.is_action_pressed("ui_left"): return CONSTANTE.izquierda
		else: return direccion
	func get_posSig():
		return posSig

func Mover():
	if not dir.SinDireccion():
		self.move_and_collide(get_process_delta_time()*dir.get_direccion()*self.velocidad)
		if dir.get_posActual().distance_to(self.position)>=64:
			self.position=dir.get_posSig() 
			dir.IgualarPosiciones(dir.posSig)
	if dir.SinDireccion():
		var nuevaDir= dir.ObtenerDireccion()
		if nuevaDir==dir.CONSTANTE.sinDireccion: return
		if $DeteccionObstaculos.PosicionLibre(dir.mapDir[nuevaDir]*64):
			dir.set_direccion(nuevaDir)
			$AnimacionPacman.play(dir.get_animacion())
		elif $DeteccionObstaculos.PosicionLibre(dir.get_direccion()*64):
			dir.set_direccion(dir.direccion)
			$AnimacionPacman.play(dir.get_animacion())
	elif dir.get_posSig()+dir.mapDir[dir.ObtenerDireccion()]*64==dir.get_posActual():
		dir.set_direccion(dir.ObtenerDireccion())
		$AnimacionPacman.play(dir.get_animacion())

func _physics_process(delta):
	Mover()