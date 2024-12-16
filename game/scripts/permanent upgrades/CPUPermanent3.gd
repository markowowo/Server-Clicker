extends TextureButton


func _on_pressed() -> void:
	if Globals.servers >= 5_000_000:
		Globals.servers -= 5_000_000
		Globals.total_permanent_upgrades_bought += 1
		Globals.cpu_permanent3_multiplier = 2
		Globals.cpu_powerup_dps = Globals.cpu_dps_increase * Globals.cpu_multiplier * Globals.cpu_permanent1_multiplier * Globals.cpu_permanent2_multiplier * Globals.cpu_permanent3_multiplier
		Globals.cpu_permanent3_used = true
		queue_free()


func _on_mouse_entered() -> void:
	$CPUPermanentUpgrade3Description.visible = true


func _on_mouse_exited() -> void:
	$CPUPermanentUpgrade3Description.visible = false
