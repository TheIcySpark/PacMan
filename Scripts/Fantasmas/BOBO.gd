extends "res://Scripts/Fantasmas/BaseFantasmas.gd"

func _ready() -> void:
	randomize()

func _physics_process(delta: float) -> void:
	if posActual!= posSig: Mover(delta)
	if posActual== posSig: ObtenerSiguientePosicionAleatoria()
