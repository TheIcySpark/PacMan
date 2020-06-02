extends CanvasLayer
onready var texturaVida: StreamTexture= preload("res://Sprites/Iconos/Pacman icono.png")
onready var informacion: VBoxContainer= $Informacion
onready var puntaje: Label= $Informacion/Puntaje

func _process(delta: float) -> void:
	puntaje.set_text("puntaje: "+ str(gJugador.puntaje)+ " ")
	ActualizarVidas()

func ActualizarVidas():
	var numVidas: int= get_tree().get_nodes_in_group("Vidas").size()
	if numVidas==gJugador.vidas: return
	var vida: TextureRect
	if numVidas<gJugador.vidas:
		while numVidas<gJugador.vidas:
			vida=TextureRect.new()
			vida.set_texture(texturaVida)
			vida.add_to_group("Vidas")
			informacion.add_child(vida)
			numVidas+=1
	elif numVidas>gJugador.vidas:
		while numVidas>gJugador.vidas:
			if numVidas==0: return
			get_tree().get_nodes_in_group("Vidas").front().queue_free()
			numVidas-=1

