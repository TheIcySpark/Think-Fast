extends VBoxContainer

onready var detallesDialog = get_parent().get_node("DetallesDialog")

func _on_Jugar_button_down() -> void:
	pass

func _on_Detalles_button_down() -> void:
	detallesDialog.popup()
