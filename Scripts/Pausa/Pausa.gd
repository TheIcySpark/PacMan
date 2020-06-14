extends CanvasLayer
onready var control: Control= $Control
onready var musica: AudioStreamPlayer2D= $Control/Musica

func Pausar()-> void:
	control.visible= true
	musica.play()

func _on_Continuar_button_up() -> void:
	get_tree().set_pause(false)
	musica.stop()
	control.visible= false


func _on_Salir_button_up() -> void:
	gMapa.tile= null
	gCambiadorEscena.CambiarEscena("res://Escenas/Niveles/Seleccion nivel/SeleccionNivel.tscn")

func _on_Reiniciar_button_up() -> void:
	gCambiadorEscena.CambiarEscena(gCambiadorEscena.escenaActual)
