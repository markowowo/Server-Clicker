extends TextureButton


func _process(_delta):
	if Globals.hdd_dravens_required > Globals.servers:
		$".".disabled = true
	if Globals.hdd_dravens_required <= Globals.servers:
		$".".disabled = false


func _on_pressed():
	var original_click_add_amount = Globals.click_add_amount
	if Globals.servers >= Globals.hdd_dravens_required:
		Globals.total_upgrades_bought += 1
		Globals.hdd_amount += 1
		Globals.hdd_dps_increase += Globals.hdd_base_dps
		$"../../../Labels/UpgradesOwned/HDDOwned".text = "Owned: " + str(Globals.hdd_amount)
		Globals.hdd_powerup_dps = Globals.hdd_dps_increase * Globals.hdd_multiplier
		Globals.servers -= Globals.hdd_dravens_required
		if get_node_or_null("../../PermanentUpgradeButtons/HBoxPermContainer/HDDPermanent1") != null:
			Globals.hdd_dravens_required *= 1.412
		if get_node_or_null("../../PermanentUpgradeButtons/HBoxPermContainer/HDDPermanent1") == null:
			Globals.hdd_dravens_required *= 1.122
		$"../../../Labels/UpgradeCosts/HDDUpgradeCost".text = "Cost: " + str(Globals.format_number(Globals.hdd_dravens_required))
		if Globals.hdd_amount == 25:
			$"../../../../Dots/HDDDots/1DotFull".visible = true
			for hdds in Globals.hdd_amount:
				Globals.click_add_amount += Globals.hdd_base_dps * 0.001
		if Globals.hdd_amount >= 26:
			Globals.click_add_amount += Globals.hdd_base_dps * 0.001
		if Globals.hdd_amount >= 50 and get_node_or_null("../../PermanentUpgradeButtons/HBoxPermContainer/HDDPermanent1") != null:
			$"../../../../Dots/HDDDots/2DotsFull".visible = true
			$"../../PermanentUpgradeButtons/HBoxPermContainer/OiPermanent1".visible = true
		if Globals.hdd_amount == 75:
			$"../../../../Dots/HDDDots/3DotsFull".visible = true
			for hdds in Globals.hdd_amount:
				Globals.click_add_amount += Globals.hdd_base_dps * 0.01
		if Globals.hdd_amount >= 76:
			Globals.click_add_amount += Globals.hdd_base_dps * 0.01
		

func _on_mouse_entered():
	$"../../../Labels/UpgradeDescriptions/HDDUpgradeDescription".visible = true


func _on_mouse_exited():
	$"../../../Labels/UpgradeDescriptions/HDDUpgradeDescription".visible = false
