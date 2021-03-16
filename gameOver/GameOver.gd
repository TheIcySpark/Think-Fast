extends CanvasLayer

func _on_Quitar_button_down() -> void:
	get_tree().quit()


func _on_Reintentar_button_down() -> void:
	get_tree().paused = false
	get_tree().change_scene("res://juego/Juego.tscn")


func _on_Menu_button_down() -> void:
	get_tree().paused = false
	get_tree().paused = false
	get_tree().change_scene("res://Menu/Menu.tscn")
