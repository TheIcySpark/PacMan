extends Area2D
onready var posicion: Position2D= $Posicion

func _on_Portal_area_entered(area: Area2D) -> void:
	area.NuevaPosicion(position+posicion.position)
