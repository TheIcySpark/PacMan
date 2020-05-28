extends "res://Scripts/Fantasmas/BaseFantasmas.gd"

func Mover():
	if dir.EnMovimiento():
		self.move_and_collide(dir.get_vectorDireccion()*velocidad*get_process_delta_time())
		if dir.posActual.distance_to(self.position)>=64:
			dir.posActual=dir.posSig
			self.position=dir.posSig
	if dir.CambioDireccionValido():
		dir.set_direccionAleatorio()
		while not $DeteccionObstaculos.PosicionLibre(dir.mapDir[dir.direccion]*64):
			dir.set_direccionAleatorio()

func _process(delta):
	Mover()

func _on_AreaColision_body_entered(body):
	Choque(body)
