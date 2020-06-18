extends Node
var rutaGuardado: String= "user://save.json"
var nivel: int= 0
var nivelTerminado: bool= false


func Guardar()-> void:
	var informacion= {}
	var informacionPorGuardar: Array= get_tree().get_nodes_in_group("guardar")
	for nodo in informacionPorGuardar:
		informacion[nodo.get_path()]= nodo.Guardar()
	var archivo: File= File.new()
	archivo.open(rutaGuardado, File.WRITE)
	
	archivo.store_line(to_json(informacion))
	
	archivo.close()

func Cargar()-> void:
	var archivo: File= File.new()
	if not archivo.file_exists(rutaGuardado): 
		Guardar()
	archivo.open(rutaGuardado, File.READ)
	var informacion= {}
	informacion= parse_json(archivo.get_as_text())
	informacion[informacion.keys()[0]]["disponible"]=true
	for rutaNodo in informacion.keys():
		var nodo= get_node(rutaNodo)
		for atributo in informacion[rutaNodo]:
			nodo.set(atributo, informacion[rutaNodo][atributo])
