extends CanvasLayer

func _on_Quitar_button_down() -> void:
	get_tree().quit()


func _on_Reintentar_button_down() -> void:
	get_tree().reload_current_scene()


func _on_Menu_button_down() -> void:
	get_tree().change_scene("res://Menu/Menu.tscn")
