extends Camera2D

func PowerUp():
	$AnimationCamara.play("Zoom out")

func FinPowerUp():
	$AnimationCamara.play("Zoom in")