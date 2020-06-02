extends Camera2D
onready var animacion: AnimationPlayer= $AnimacionCamara

func _ready():
	animacion.play("Zoom in")
