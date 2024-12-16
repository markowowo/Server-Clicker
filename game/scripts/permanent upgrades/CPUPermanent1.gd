extends TextureButton


func _on_pressed() -> void:
	if Globals.servers >= 2000:
		Globals.cpu_permanent1_multiplier = 10
		Globals.cpu_powerup_dps = Globals.cpu_dps_increase * Globals.cpu_multiplier * Globals.cpu_permanent1_multiplier * Globals.cpu_permanent2_multiplier
		Globals.total_permanent_upgrades_bought += 1
		Globals.servers -= 2000
		Globals.cpu_permanent1_used = true
		queue_free()
	else:
		pass

func _on_mouse_entered() -> void:
	$CPUPermanentUpgrade1Description.visible = true


func _on_mouse_exited() -> void:
	$CPUPermanentUpgrade1Description.visible = false
