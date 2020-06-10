extends TextureButton
export var escena: String
onready var estrella: TextureRect= $Completado
var disponible: bool= false
var completado: bool= false

func _ready() -> void:
	Inicializar()

func Inicializar()-> void:
	if completado: estrella.set_modulate(Color(255, 255, 255, 255))
	if disponible: set_disabled(false)

func _on_BotonSeleccionNivel_button_up() -> void:
	get_tree().change_scene(escena)