extends RigidBody2D

export var velocidad: float

func _physics_process(delta: float) -> void:
	var direccion: Vector2 = obtener_input()
	set_linear_velocity(direccion * velocidad)


func obtener_input() -> Vector2:
	var direccion: Vector2 = Vector2.ZERO
	if Input.is_action_pressed("ui_arriba"):
		direccion += Vector2.UP
	if Input.is_action_pressed("ui_derecha"):
		direccion += Vector2.RIGHT
	if Input.is_action_pressed("ui_abajo"):
		direccion += Vector2.DOWN
	if Input.is_action_pressed("ui_izquierda"):
		direccion += Vector2.LEFT
	direccion = direccion.normalized()
	return direccion
