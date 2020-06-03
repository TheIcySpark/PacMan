extends Camera2D
onready var animacion: AnimationPlayer= $AnimacionCamara

func _ready():
	animacion.play("Zoom in")

func ZoomIn()-> void:
	animacion.play("Zoom in")

func ZoomOut()-> void:
	animacion.play("Zoom out")