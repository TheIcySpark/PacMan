extends CanvasLayer
onready var control: Control= $Control

func _on_Continuar_button_up() -> void:
	get_tree().set_pause(false)
	control.visible= false


func _on_Salir_button_up() -> void:
	gMapa.tile= null
	gCambiadorEscena.CambiarEscena("res://Escenas/Niveles/Seleccion nivel/SeleccionNivel.tscn")