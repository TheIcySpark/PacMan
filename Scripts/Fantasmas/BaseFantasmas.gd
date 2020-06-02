extends KinematicBody2D
onready var areaColision: Area2D= $AreaColision

func _ready()-> void:
	areaColision.connect("body_entered", self, "Choque")

func Choque(body: KinematicBody2D)-> void:
	if gJugador.powerUp:
		gJugador.puntaje+=5
		queue_free()
	else:
		body.Muerte()