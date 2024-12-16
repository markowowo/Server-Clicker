extends Control


func _on_back_button_pressed() -> void:
	$".".visible = false


func _on_stats_button_pressed() -> void:
	$"../StatsScreen".visible = true


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_credits_button_pressed() -> void:
	$"../Credits".visible = true


func _on_settings_button_pressed() -> void:
	$"../SettingsScreen".visible = true
