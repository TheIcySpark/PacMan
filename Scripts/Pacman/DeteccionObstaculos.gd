extends RayCast2D

func PosicionLibre(pos: Vector2)->bool:
	self.set_cast_to(pos)
	self.force_raycast_update()
	if self.is_colliding(): return false
	else: return true