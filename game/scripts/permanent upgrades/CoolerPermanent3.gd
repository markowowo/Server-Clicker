extends TextureButton


func _on_pressed():
	if Globals.servers >= 10_000_000:
		Globals.total_permanent_upgrades_bought += 1
		Globals.servers -= 10_000_000
		Globals.cooler_click_add_amount *= 4
		Globals.cooler_multiplier *= 4
		Globals.cooler_permanent3_used = true
		queue_free()


func _on_mouse_entered():
	$CoolerPermanentUpgrade3Description.visible = true


func _on_mouse_exited():
	$CoolerPermanentUpgrade3Description.visible = false
