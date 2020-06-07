extends TileMap

func _ready()-> void:
	gMapa.tile= self
	PonerComida()

func PonerComida()-> void:
	var eComida=preload("res://Escenas/Consumibles/Comida.tscn")
	var comida
	var posicionesValidas: Array= get_used_cells_by_id(1)
	for posicion in posicionesValidas:
		comida=eComida.instance()
		comida.position=posicion*64
		comida.position+= Vector2(32, 32)
		add_child(comida)