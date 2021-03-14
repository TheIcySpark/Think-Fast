extends Node2D
export var velocidad: float


func _physics_process(delta: float) -> void:
	set_position(Vector2(position.x - velocidad * delta, position.y))
