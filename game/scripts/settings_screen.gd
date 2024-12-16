extends Control


func _on_back_button_pressed() -> void:
	$".".visible = false


func _on_full_screen_setting_pressed() -> void:
	if $FullScreenSetting.button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
