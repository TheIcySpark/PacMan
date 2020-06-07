extends Node
var tile: TileMap

func PosicionValida(pos: Vector2)-> bool:
	if tile.get_cellv(tile.world_to_map(pos))== 1: return true
	else: return false
