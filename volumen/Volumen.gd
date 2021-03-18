extends Node


var RUTA_GUARDADO_VOLUMEN = "user://volumen.dat"
var datos = {"volumen_musica": 100, "volumen_sonidos": 100}


func guardar_datos_volumen() -> void:
	var archivo = File.new()
	var error = archivo.open(RUTA_GUARDADO_VOLUMEN, File.WRITE)
	if error == OK:
		archivo.store_var(datos)
		archivo.close()



func cargar_datos_volumen():
	var archivo = File.new()
	if archivo.file_exists(RUTA_GUARDADO_VOLUMEN):
		var error = archivo.open(RUTA_GUARDADO_VOLUMEN, File.READ)
		if error == OK:
			datos = archivo.get_var()
			archivo.close()

