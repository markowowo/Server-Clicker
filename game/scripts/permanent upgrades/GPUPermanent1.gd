extends TextureButton


func _on_pressed():
	if Globals.servers >= 100_000_000:
		Globals.total_permanent_upgrades_bought += 1
		Globals.servers -= 100_000_000
		Globals.cpu_multiplier *= 2
		Globals.ram_multiplier *= 2
		Globals.hdd_multiplier *= 2
		Globals.gpu_multiplier *= 2
		Globals.cpu_powerup_dps = Globals.cpu_dps_increase * Globals.cpu_multiplier
		Globals.ram_powerup_dps = Globals.ram_dps_increase * Globals.ram_multiplier
		Globals.hdd_powerup_dps = Globals.hdd_dps_increase * Globals.hdd_multiplier
		Globals.gpu_powerup_dps = Globals.gpu_dps_increase * Globals.gpu_multiplier
		queue_free()


func _on_mouse_entered():
	$GPUPermanentUpgrade1Description.visible = true


func _on_mouse_exited():
	$GPUPermanentUpgrade1Description.visible = false
