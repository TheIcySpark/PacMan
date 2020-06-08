extends "res://Scripts/Fantasmas/BaseFantasmas.gd"

func _ready() -> void:
	randomize()

func ObtenerDireccion()-> Vector2:
	var aleatorio=randi()%5
	match aleatorio:
		0: return Vector2.UP
		1: return Vector2.RIGHT
		2: return Vector2.DOWN
		3: return Vector2.LEFT
		4: return Vector2.ZERO

func EstablecerSiguienteDireccion()-> void:
	direccion= ObtenerDireccion()
	if gMapa.PosicionValida(posActual+ direccion* 64):
		posSig= posActual+ direccion* 64
		animacion.play(mapAnim[direccion])

func _physics_process(delta: float) -> void:
	if posActual!= posSig: Mover(delta)
	if posActual== posSig: EstablecerSiguienteDireccion()