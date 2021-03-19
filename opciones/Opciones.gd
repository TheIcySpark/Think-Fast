extends AcceptDialog
export var musica1: NodePath
export var musica2: NodePath
export var musica3: NodePath
export var sonidos: NodePath


func _ready() -> void:
	$Volumen.cargar_datos_volumen()
	$Container/SliderMusica.value = $Volumen.datos["volumen_musica"]
	$Container/SliderSonidos.value = $Volumen.datos["volumen_sonidos"]
	actualizar_volumen_musica()
	actualizar_volumen_sonidos()


func actualizar_volumen_musica() -> void:
	if musica1 != "":
		get_node(musica1).set_volume_db($Volumen.datos["volumen_musica"])
	if musica2 != "":
		get_node(musica2).set_volume_db($Volumen.datos["volumen_musica"])
	if musica3 != "":
		get_node(musica3).set_volume_db($Volumen.datos["volumen_musica"])


func actualizar_volumen_sonidos() -> void:
	if sonidos != "":
		get_node(sonidos).set_volume_db($Volumen.datos["volumen_sonidos"])


func _on_SliderMusica_value_changed(value: float) -> void:
	$Volumen.datos["volumen_musica"] = value
	$Volumen.guardar_datos_volumen()
	actualizar_volumen_musica()


func _on_SliderSonidos_value_changed(value: float) -> void:
	$Volumen.datos["volumen_sonidos"] = value
	$Volumen.guardar_datos_volumen()
	actualizar_volumen_sonidos()
