extends TextureButton


func _on_pressed() -> void:
	if Globals.servers >= 1_000_000:
		Globals.total_permanent_upgrades_bought += 1
		Globals.servers -= 1_000_000
		Globals.cooler_click_add_amount *= 10
		Globals.cooler_multiplier *= 10
		Globals.cooler_click_add_amount += Globals.cooler_multiplier
		Globals.cooler_permanent2_used = true
		queue_free()


func _on_mouse_entered():
	$CoolerPermanentUpgrade2Description.visible = true


func _on_mouse_exited():
	$CoolerPermanentUpgrade2Description.visible = false
