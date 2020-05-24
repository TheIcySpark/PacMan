extends "res://Scripts/MovimientoPacMan.gd"
enum CONSTANTE{velcidadPowerUp=400,velocidad=256,tiempoPowerUp=10}
onready var puntaje=0 setget  set_puntaje, get_puntaje

func _ready():
	animationPlayer.play(mapAnim[direccion])
	$CamaraPacMan/AnimationCamara.play("Zoom in")


func Pruebas():
	pass

func PowerUp():
	$PowerUpTimer.start(CONSTANTE.tiempoPowerUp)
	$CamaraPacMan.PowerUp()
	velocidad=CONSTANTE.velcidadPowerUp


func _on_PowerUpTimer_timeout():
	$CamaraPacMan.FinPowerUp()
	velocidad=CONSTANTE.velocidad

func set_puntaje(valor:int):
	puntaje=valor
	$CamaraPacMan/GUI.ActualizarPuntaje(valor)

func get_puntaje():
	return puntaje
