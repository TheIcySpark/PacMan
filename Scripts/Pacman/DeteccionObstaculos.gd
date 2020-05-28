extends RayCast2D

func PosicionLibre(pos)->bool:
	self.set_cast_to(pos)
	self.force_raycast_update()
	if self.is_colliding(): return false
	return true