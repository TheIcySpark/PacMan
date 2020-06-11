extends Node2D
export var seleccionNivel: String= "res://Escenas/Niveles/Seleccion nivel/SeleccionNivel.tscn"
onready var pausa: Control= $Pausa/Control

func _ready() -> void:
	gMapa.CrearCuadricula()
	gGuardado.nivelTerminado= false

func _process(delta: float) -> void:
	if get_tree().get_nodes_in_group("consumibles").empty(): FinJuego()

func _input(event: InputEvent) -> void:
	if event.is_action("ui_pausa"):
		pausa.visible= true
		get_tree().set_pause(true)

func FinJuego()-> void:
	#Guardar parametros
	#Cambiar escena
	gGuardado.nivelTerminado= true
	gMapa.tile= null
	get_tree().set_pause(true)
	gCambiadorEscena.CambiarEscena(seleccionNivel)