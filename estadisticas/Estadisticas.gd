extends Node
export var score: NodePath

var RUTA_GUARDADO_ESTADISTICAS = "user://estadisticas.dat"
var datos = {"record": 0, "numero_partidas_jugadas": 0}


func guardar_estadisticas() -> void:
	cargar_estadisticas()
	if int(get_node(score).text) > datos["record"]:
		datos["record"] = int(get_node(score).text)
	datos["numero_partidas_jugadas"] += 1
	var archivo = File.new()
	var error = archivo.open_encrypted_with_pass(
			RUTA_GUARDADO_ESTADISTICAS, File.WRITE, "godot_wild_jam")
	if error == OK:
		archivo.store_var(datos)
		archivo.close()



func cargar_estadisticas():
	var archivo = File.new()
	if archivo.file_exists(RUTA_GUARDADO_ESTADISTICAS):
		var error = archivo.open_encrypted_with_pass(
				RUTA_GUARDADO_ESTADISTICAS, File.READ, "godot_wild_jam")
		if error == OK:
			datos = archivo.get_var()
			archivo.close()
