extends Area2D

func _ready() -> void:
	connect("area_entered", self, "Consumido")
	add_to_group("consumibles")

func Consumido(area: Area2D)-> void:
	pass

