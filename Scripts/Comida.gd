extends Area2D

func _ready():
	pass # Replace with function body.


func _on_Comida_body_entered(body):
	body.set_puntaje(body.get_puntaje()+50)
	queue_free()
