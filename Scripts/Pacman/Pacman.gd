extends "res://Scripts/Pacman/BasePacman.gd"

func PowerUp():
	if not self.PowerUpActivado(): $CamaraPacMan.PowerUp()
	$PowerUpTimer.start(10)

func _on_PowerUpTimer_timeout():
	$CamaraPacMan.FinPowerUp()

func PowerUpActivado()->bool:
	if $PowerUpTimer.get_time_left()>0: return true
	else: return false

func Muerte():
	vidas.QuitarVida()
	self.position=posInicial