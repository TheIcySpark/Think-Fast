extends Node2D
onready var estadisticas = $Estadisticas

export var game_over_music: AudioStream
export var die_sound: AudioStream

func _ready() -> void:
	get_tree().paused = false
	estadisticas.cargar_estadisticas()
	$Score/Control/Container2/Record.text = str(estadisticas.datos["record"])


func finalizar_juego() -> void:
	$GameOver/UI.visible = true
	$Camara/Animacion.play("sacudirCamara")
	estadisticas.guardar_estadisticas()
	$SonidosFondo.set_stream(die_sound)
	$SonidosFondo.pitch_scale = 1
	$SonidosFondo.play()
	$GameOver/Musica.play()
	get_tree().set_pause(true)




func _on_Visibilidad_screen_exited() -> void:
	finalizar_juego()
