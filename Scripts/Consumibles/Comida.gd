extends "res://Scripts/Consumibles/BaseConsumibles.gd"

func _on_Comida_body_entered(body):
	self.Consumido(5)
