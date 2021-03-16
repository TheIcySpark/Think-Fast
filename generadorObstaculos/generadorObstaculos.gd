extends Node
export var patron1: PackedScene
export var patron2: PackedScene
export var velocidad: int

var patrones: Array
var patron_activo_a: int = -1
var patron_activo_b: int = -1

func _ready() -> void:
	instanciar_escenas()
	randomize()
	activar_patron_obstaculos(obtener_patron_aleatorio())


func _process(delta: float) -> void:
	if patrones[patron_activo_a].position.x < 0 and patron_activo_b == -1:
		activar_patron_obstaculos(obtener_patron_aleatorio())
	if patrones[patron_activo_a].get_node("posicionSiguiente").get_global_position().x < 0:
		desactivar_patron_obstaculos()


func desactivar_patron_obstaculos() -> void:
	patrones[patron_activo_a].velocidad = 0
	patron_activo_a = patron_activo_b
	patron_activo_b = -1
	velocidad += 10


func activar_patron_obstaculos(indice: int) -> void:
	if patron_activo_a == -1:
		patron_activo_a = indice
		patrones[patron_activo_a].velocidad = velocidad
	else:
		patron_activo_b = indice
		patrones[patron_activo_b].velocidad = velocidad
		patrones[patron_activo_b].set_global_position(
				patrones[patron_activo_a].get_node("posicionSiguiente").get_global_position())


func obtener_patron_aleatorio() -> int:
	var indice: int = randi() % patrones.size()
	while(patrones[indice].velocidad > 0):
		indice = randi() % patrones.size()
	return indice

func instanciar_escenas() -> void:
	patrones.append(patron1.instance())
	add_child(patrones.back())
	patrones.append(patron2.instance())
	add_child(patrones.back())


