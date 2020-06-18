extends Control

func _ready() -> void:
	gGuardado.Cargar()
	if gGuardado.nivelTerminado:
		var niveles: Array= get_tree().get_nodes_in_group("guardar")
		var i=0
		while i<niveles.size():
			if niveles[i].nivel== gGuardado.nivel:
				niveles[i].completado= true
				if i+1<niveles.size(): niveles[i+1].disponible= true
				break
			i+=1
		gGuardado.Guardar()
