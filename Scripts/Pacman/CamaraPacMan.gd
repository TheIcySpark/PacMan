extends Camera2D
onready var tiles=get_tree().get_nodes_in_group("Tiles").front() #Automatizar Limites

func _ready():
	$AnimacionCamara.play("Zoom in")

func PowerUp():
	$AnimacionCamara.play("Zoom out")

func FinPowerUp():
	$AnimacionCamara.play("Zoom in")