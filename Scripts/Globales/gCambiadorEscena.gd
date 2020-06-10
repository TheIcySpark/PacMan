extends CanvasLayer
onready var animacion: AnimationPlayer= $Control/ColorRect/Animacion

func CambiarEscena(nuevaEscena: String)-> void:
	animacion.play("Desaparecer")
	yield(animacion, "animation_finished")
	get_tree().change_scene(nuevaEscena)
	animacion.play_backwards("Desaparecer")
	yield(animacion, "animation_finished")