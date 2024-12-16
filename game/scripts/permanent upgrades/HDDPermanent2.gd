extends TextureButton



func _on_pressed():
	if Globals.servers >= 10_000_000:
		Globals.total_permanent_upgrades_bought += 1
		Globals.servers -= 10_000_000
		Globals.hdd_permanent2_multiplier = 10
		Globals.hdd_dps_increase += Globals.hdd_base_dps
		Globals.hdd_powerup_dps = Globals.hdd_dps_increase * Globals.hdd_multiplier * Globals.hdd_permanent2_multiplier
		Globals.hdd_permanent2_used = true
		queue_free()


func _on_mouse_entered():
	$HDDPermanentUpgrade2Description.visible = true


func _on_mouse_exited():
	$HDDPermanentUpgrade2Description.visible = false
