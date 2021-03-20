extends Area2D


func _on_Visibilidad_screen_exited() -> void:
	queue_free()

func power_up_tomado() -> void:
	get_parent().get_parent().get_parent().get_parent().get_node("Camara").get_node("Animacion").play("sacudirCamara")
	get_parent().get_parent().get_parent().get_parent().get_node("SonidosFondo").play(0.3)
	queue_free()
