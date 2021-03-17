extends CanvasLayer


func _on_Timer_timeout() -> void:
	$Control/Container/Score.text = str(int($Control/Container/Score.text) + 1)
	if int($Control/Container/Score.text) > int($Control/Container2/Record.text):
		$Control/Container2/Record.text = $Control/Container/Score.text
