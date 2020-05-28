extends HBoxContainer
var texturaVida=preload("res://Sprites/Iconos/Pacman icono.png")

func _ready():
	for i in range(3):
		AgregarVida()

func VidasRestantes()->int:
	return get_tree().get_nodes_in_group("Vidas").size()

func QuitarVida()->void:
	get_tree().get_nodes_in_group("Vidas").back().queue_free()

func AgregarVida()->void:
	var vida:TextureRect
	vida=TextureRect.new()
	vida.set_texture(texturaVida)
	vida.add_to_group("Vidas")
	self.add_child(vida)