extends Node

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("ui_pausar")):
		get_tree().paused = not get_tree().paused
		$Pausa/Control.visible = get_tree().paused
