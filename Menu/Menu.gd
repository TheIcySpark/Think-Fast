extends Control

onready var estadisticas = $Estadisticas


func _ready() -> void:
	get_tree().paused = false
	estadisticas.cargar_estadisticas()
	$EstadisticasPopup/Contenedor/PartidasJugadas.text = \
			"number of games played: " + str(estadisticas.datos["numero_partidas_jugadas"])
	$EstadisticasPopup/Contenedor/Record.text = \
			"Record: " + str(estadisticas.datos["record"])


func _on_Jugar_button_down() -> void:
	get_tree().change_scene("res://juego/Juego.tscn")


func _on_Detalles_button_down() -> void:
	$DetallesDialog.popup()


func _on_Quitar_button_down() -> void:
	get_tree().quit()


func _on_Estadisticas_button_down() -> void:
	$EstadisticasPopup.popup()


func _on_Opciones_button_down() -> void:
	$Opciones.popup()


func _on_Creditos_button_down() -> void:
	$CreditosPopup.popup()


func _on_ComoJugar_button_down() -> void:
	$ComoJugarPopup.popup()
