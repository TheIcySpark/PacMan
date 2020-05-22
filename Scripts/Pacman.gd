extends "res://Scripts/MovimientoPacMan.gd"
enum CONSTANTE{velcidadPowerUp=400,velocidad=256}

func _ready():
	animationPlayer.play(mapAnim[direccion])
	PowerUp(10)

func PowerUp(tiempo:int):
	$PowerUpTimer.start(tiempo)
	$CamaraPacMan.PowerUp()
	velocidad=CONSTANTE.velcidadPowerUp


func _on_PowerUpTimer_timeout():
	$CamaraPacMan.FinPowerUp()
	velocidad=CONSTANTE.velocidad
