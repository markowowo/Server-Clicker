extends TextureButton


func _on_pressed():
	if Globals.servers >= 10_000_000:
		Globals.total_permanent_upgrades_bought += 1
		Globals.servers -= 10_000_000
		Globals.cpu_permanent4_multiplier = 4
		Globals.cpu_powerup_dps = Globals.cpu_dps_increase * Globals.cpu_multiplier * Globals.cpu_permanent1_multiplier * Globals.cpu_permanent2_multiplier * Globals.cpu_permanent3_multiplier * Globals.cpu_permanent4_multiplier
		Globals.cpu_permanent4_used = true
		queue_free()


func _on_mouse_entered():
	$CPUPermanentUpgrade4Description.visible = true


func _on_mouse_exited():
	$CPUPermanentUpgrade4Description.visible = false
