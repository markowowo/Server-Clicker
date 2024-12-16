extends TextureButton

signal ram_permanent_bought

func _on_pressed() -> void:
	if Globals.servers >= 1_000_000:
		Globals.total_permanent_upgrades_bought += 1
		Globals.servers -= 1_000_000
		Globals.ram_permanent1_multiplier = 10
		$"../../../../../Dots/CPUDots/5DotsEmpty".visible = true
		$"../../../../../Dots/CPUDots/CPUDotsInfoHover".visible = true
		$"../../../../../Dots/CoolerDots/CoolerDotsInfoHover".visible = true
		$"../../../../../Dots/RAMDots/RAMDotsInfoHover".visible = true
		$"../../../../../Dots/CoolerDots/5DotsEmpty".visible = true
		$"../../../../../Dots/RAMDots/5DotsEmpty".visible = true
		ram_permanent_bought.emit()
		Globals.ram_permanent1_used = true
		queue_free()
		


func _on_mouse_entered() -> void:
	$RAMPermanentUpgrade1Description.visible = true


func _on_mouse_exited() -> void:
	$RAMPermanentUpgrade1Description.visible = false
