extends HBoxContainer
var texturaVida=preload("res://Sprites/Iconos/Pacman icono.png")

func _ready():
	var vida:TextureRect
	for i in range(3):
		vida=TextureRect.new()
		vida.set_texture(texturaVida)
		vida.add_to_group("Vidas")
		self.add_child(vida)

func VidasRestantes()->int:
	return get_tree().get_nodes_in_group("Vidas").size()

func QuitarVida()->void:
	get_tree().get_nodes_in_group("Vidas").pop_back()