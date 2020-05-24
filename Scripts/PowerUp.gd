extends Area2D

func _on_PowerUp_body_entered(body):
	body.set_puntaje(body.get_puntaje()+500)
	body.PowerUp()
	queue_free()
