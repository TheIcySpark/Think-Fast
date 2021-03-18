extends Node
var posicion_musica: float = 0

func _input(event: InputEvent) -> void:
	if get_parent().get_node("GameOver/UI").visible:
		return
	if event.is_action_pressed("ui_pausar"):
		get_tree().paused = not get_tree().paused
		$Pausa/Control.visible = get_tree().paused
		if get_tree().paused:
			$Musica.play(posicion_musica)
		else:
			posicion_musica = $Musica.get_playback_position()
			$Musica.stop()
