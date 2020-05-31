extends Node
onready var nav:Navigation2D=$Navegacion
onready var mapa:TileMap=$Navegacion/Mapa

func _ready():
	var camino=nav.get_simple_path(Vector2(96,96),Vector2(64,192),true)
	print (camino)