extends CanvasLayer

func _on_Continuar_button_down() -> void:
	get_tree().set_pause(false)
	$Control.visible = false


func _on_Reinicar_button_down() -> void:
	get_tree().reload_current_scene()


func _on_Opciones_button_down() -> void:
	pass # Replace with function body.


func _on_Menu_button_down() -> void:
	get_tree().change_scene("res://Menu/Menu.tscn")


func _on_Salir_button_down() -> void:
	get_tree().quit()
