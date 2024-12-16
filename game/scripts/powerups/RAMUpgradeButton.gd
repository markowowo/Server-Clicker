extends TextureButton


func _process(_delta):
	$"../../../../ClickCountLabel".text = str(Globals.server_clicks)
	if Globals.ram_dravens_required > Globals.servers:
		$".".disabled = true
	if Globals.ram_dravens_required <= Globals.servers:
		$".".disabled = false
	if Globals.ram_dravens_required >= 10000:
		$"../../../../ServerButtonImage3".position.x = 910
		$"../../../Labels/UpgradesOwned/RAMOwned".position.x = 933
		

func _on_pressed():
	if Globals.servers >= Globals.ram_dravens_required:
		Globals.total_upgrades_bought += 1
		Globals.ram_amount += 1
		Globals.ram_dps_increase += 100
		$"../../../Labels/UpgradesOwned/RAMOwned".text = "Owned: " + str(Globals.ram_amount)
		Globals.servers -= Globals.ram_dravens_required
		Globals.ram_dravens_required *= 1.412
		if Globals.ram_amount >= 25:
			Globals.ram_dravens_required *= (1 / 1.412) * 1.059
			$"../../../../Dots/RAMDots/1DotFull".visible = true
		if Globals.ram_amount == 50:
			$"../../../../Dots/RAMDots/2DotsFull".visible = true
			Globals.cpu_multiplier *= 1.50
			Globals.cpu_powerup_dps = Globals.cpu_dps_increase * Globals.cpu_multiplier
		if Globals.ram_amount >= 51:
			Globals.cpu_multiplier *= 1.01
			Globals.cpu_powerup_dps = Globals.cpu_dps_increase * Globals.cpu_multiplier
		if Globals.ram_amount == 75:
			$"../../../../Dots/RAMDots/3DotsFull".visible = true
			for upgrades in Globals.total_upgrades_bought:
				Globals.autoclick_interval -= 0.005
		if Globals.ram_amount >= 75:
			Globals.autoclick_interval -= 0.005
		$"../../../Labels/UpgradeCosts/RAMUpgradeCost".text = "Cost: " + str(Globals.format_number(Globals.ram_dravens_required))
	else:
		pass


func _on_mouse_entered() -> void:
	$"../../../Labels/UpgradeDescriptions/RAMUpgradeDescription".visible = true


func _on_mouse_exited() -> void:
	$"../../../Labels/UpgradeDescriptions/RAMUpgradeDescription".visible = false
