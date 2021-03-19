extends "res://powerUp/PowerUpBase.gd"


func _on_PowerUpRelentizar_body_entered(body: Node) -> void:
	get_parent().get_parent().get_parent().velocidad -= 100
	queue_free()
