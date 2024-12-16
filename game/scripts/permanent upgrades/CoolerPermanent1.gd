extends TextureButton


func _on_pressed() -> void:
	if Globals.servers >= 10000:
		Globals.total_permanent_upgrades_bought += 1
		Globals.click_add_amount *= 5
		Globals.servers -= 10000
		Globals.cooler_permanent1_used = true
		queue_free()
	else:
		pass


func _on_mouse_entered() -> void:
	$CoolerPermanentUpgrade1Description.visible = true


func _on_mouse_exited() -> void:
	$CoolerPermanentUpgrade1Description.visible = false
