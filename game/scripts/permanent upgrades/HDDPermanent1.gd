extends TextureButton


func _on_pressed():
	if Globals.servers >= 30_000_000:
		Globals.total_permanent_upgrades_bought += 1
		Globals.servers -= 30_000_000
		Globals.hdd_base_dps *= 10
		for hdds in Globals.hdd_amount:
			Globals.hdd_dps_increase += Globals.hdd_base_dps
		Globals.hdd_powerup_dps = Globals.hdd_dps_increase * Globals.hdd_multiplier * Globals.hdd_permanent2_multiplier
		Globals.hdd_permanent1_used = true
		queue_free()


func _on_mouse_entered():
	$HDDPermanentUpgrade1Description.visible = true


func _on_mouse_exited():
	$HDDPermanentUpgrade1Description.visible = false
