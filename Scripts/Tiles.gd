extends TileMap

func _ready():
	PonerComida()

func PonerComida():
	var aumento=64
	var offset=32
	var escenaComida=preload("res://Escenas/Comida.tscn")
	var i=0
	var j=0
	while get_cellv(world_to_map(Vector2(i,j)))!=-1:
		while get_cellv(world_to_map(Vector2(i,j)))!=-1:
			print(get_cellv(world_to_map(Vector2(i,j))))
			if get_cellv(world_to_map(Vector2(i,j)))==1:
				var comida=escenaComida.instance()
				comida.position=Vector2(i+offset,j+offset)
				add_child(comida)
			j+=aumento
		i+=aumento
		j=0
