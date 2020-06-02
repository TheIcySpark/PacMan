extends Node
onready var tileMap: TileMap= $TileMap
onready var camaraPacman: Camera2D= $Pacman/CamaraPacMan

func _ready()-> void:
	LimitesMapa()

func LimitesMapa()-> void:
	var lim: Rect2= tileMap.get_used_rect()
	camaraPacman.limit_top= lim.position.y* 64
	camaraPacman.limit_right= lim.end.x* 64
	camaraPacman.limit_bottom= lim.end.y* 64
	camaraPacman.limit_left= lim.position.x* 64