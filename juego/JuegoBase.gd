extends Node2D

func _ready() -> void:
	get_tree().paused = false

func _on_Visibilidad_screen_exited() -> void:
	$Jugador/GameOver/UI.visible = true
	$Camara/Animacion.play("sacudirCamara")
	get_tree().set_pause(true)
