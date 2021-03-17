extends VBoxContainer

onready var detallesDialog = get_parent().get_node("DetallesDialog")
export var escenaJuego: String

func _ready() -> void:
	get_tree().paused = false

func _on_Jugar_button_down() -> void:
	get_tree().change_scene(escenaJuego)

func _on_Detalles_button_down() -> void:
	detallesDialog.popup()

func _on_Quitar_button_down() -> void:
	get_tree().quit()
