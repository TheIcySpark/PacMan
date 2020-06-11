extends TextureButton
export var escena: String
export var nivel: int
onready var estrella: TextureRect= $Completado
onready var etiquetaNivel: Label= $Nivel
var disponible: bool= false
var completado: bool= false

func _ready() -> void:
	Inicializar()

func Inicializar()-> void:
	etiquetaNivel.set_text(str(nivel))
	if completado: estrella.set_modulate(Color( 255, 255, 255))
	if disponible: set_disabled(false)

func _on_BotonSeleccionNivel_button_up() -> void:
	gCambiadorEscena.CambiarEscena(escena)