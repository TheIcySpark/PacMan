extends Area2D

func _on_PowerUp_body_entered(body):
	body.PowerUp()
	queue_free()
