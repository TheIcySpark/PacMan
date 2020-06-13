extends CanvasLayer
onready var animacion: AnimationPlayer= $Control/ColorRect/Animacion
var escenaActual: String

func CambiarEscena(nuevaEscena: String)-> void:
	get_tree().set_pause(true)
	animacion.play("Desaparecer")
	yield(animacion, "animation_finished")
	get_tree().change_scene(nuevaEscena)
	animacion.play_backwards("Desaparecer")
	yield(animacion, "animation_finished")
	get_tree().set_pause(false)
	escenaActual= nuevaEscena