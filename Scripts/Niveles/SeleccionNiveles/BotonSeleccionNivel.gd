extends TextureButton
onready var estrella: TextureRect= $Completado
onready var etiquetaNivel: Label= $Nivel
export var escena: String
export var nivel: int
var disponible: bool= false setget set_disponible
var completado: bool= false setget set_completado

func _ready() -> void:
	etiquetaNivel.set_text(str(nivel))

func set_disponible(dis: bool)-> void:
	disponible= dis
	set_disabled(not disponible)

func set_completado(comp: bool)-> void:
	completado= comp
	if completado: estrella.set_modulate(Color( 1, 1, 1))
	else: estrella.set_modulate(Color(0, 0, 0))


func _on_BotonSeleccionNivel_button_up() -> void:
	gGuardado.nivel= nivel
	gCambiadorEscena.CambiarEscena(escena)

func Guardar():
	var datos={
		disponible= disponible,
		completado= completado
	}
	return datos