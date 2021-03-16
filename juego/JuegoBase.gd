extends Node2D



func _on_Visibilidad_screen_exited() -> void:
	$Jugador/GameOver/UI.visible = true
	get_tree().paused = true
