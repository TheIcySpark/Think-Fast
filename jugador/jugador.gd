extends KinematicBody2D

export var generador_obstaculos: NodePath
export var velocidad: float

var velocidad_obstaculos = 0


func _process(delta: float) -> void:
	obtener_velocidad_obstaculos()


func _physics_process(delta: float) -> void:
	var direccion: Vector2 = obtener_direccion()
	set_position(Vector2(position.x + (velocidad_obstaculos * delta * direccion.x),
			position.y + (velocidad_obstaculos * delta * direccion.y)))
	move_and_slide(direccion * velocidad)


func obtener_velocidad_obstaculos():
	if generador_obstaculos != "":
		velocidad_obstaculos = get_node(generador_obstaculos).velocidad

func obtener_direccion() -> Vector2:
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
