extends Node

export var patrones_disponibles: Array
export var power_ups_disponibles: Array
export var velocidad: int

var patrones: Array
var power_ups: Array
var patron_activo_a: int = -1
var patron_activo_b: int = -1
var power_up_disponible = false


func _ready() -> void:
	instanciar_escenas()
	cargar_power_ups()
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


func activar_patron_obstaculos(indice: int) -> void:
	if patron_activo_a == -1:
		patron_activo_a = indice
		patrones[patron_activo_a].velocidad = velocidad
	else:
		patron_activo_b = indice
		patrones[patron_activo_b].velocidad = velocidad
		patrones[patron_activo_b].set_global_position(
				patrones[patron_activo_a].get_node("posicionSiguiente").get_global_position())
		activar_power_up()


func activar_power_up() -> void:
	if !power_up_disponible: return
	var probabilidad: int = randi() % 100
	if probabilidad > 25:
		var indice: int = randi() % power_ups.size()
		patrones[patron_activo_b].get_node("PosicionPowerUp").add_child(power_ups[indice])
		power_ups[indice] = power_ups_disponibles[indice].instance()
		power_up_disponible = false
		$TiempoSiguientePowerUp.start(10)


func obtener_patron_aleatorio() -> int:
	var indice: int = randi() % patrones.size()
	while(patrones[indice].velocidad > 0):
		indice = randi() % patrones.size()
	return indice


func instanciar_escenas() -> void:
	var i = 0
	while i < patrones_disponibles.size():
		patrones.append(patrones_disponibles[i].instance())
		add_child(patrones.back())
		i += 1


func _on_Timer_timeout() -> void:
	velocidad += 1
	if patron_activo_a != -1:
		patrones[patron_activo_a].velocidad = velocidad
	if patron_activo_b != -1:
		patrones[patron_activo_b].velocidad = velocidad


func cargar_power_ups() -> void:
	var i = 0
	while i < power_ups_disponibles.size():
		power_ups.append(power_ups_disponibles[i].instance())
		i += 1


func _on_TiempoSiguientePowerUp_timeout() -> void:
	power_up_disponible = true
