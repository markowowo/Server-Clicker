extends Control

signal credits_opened

func _on_back_button_pressed() -> void:
	$".".visible = false
	credits_opened.emit()
