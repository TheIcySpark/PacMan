extends Node2D
export var seleccionNivel: String= "res://Escenas/Niveles/Seleccion nivel/SeleccionNivel.tscn"

func _ready() -> void:
	gMapa.CrearCuadricula()

func _process(delta: float) -> void:
	if get_tree().get_nodes_in_group("consumibles").empty(): FinJuego()

func FinJuego()-> void:
	#Guardar parametros
	#Cambiar escena
	gMapa.tile= null
	get_tree().change_scene(seleccionNivel)