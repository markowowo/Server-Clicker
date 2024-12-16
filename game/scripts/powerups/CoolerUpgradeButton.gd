extends TextureButton

func _ready() -> void:
			$"../../../Labels/UpgradeCosts/CoolerUpgradeCost".text = "Cost: " + str(Globals.cooler_dravens_required)
			
func _process(_delta: float) -> void:
	if Globals.cooler_dravens_required > Globals.servers:
		$".".disabled = true
	if Globals.cooler_dravens_required <= Globals.servers:
		$".".disabled = false
	if Globals.cooler_dravens_required >= 1000:
		$"../../../../ServerButtonImage2".position.x = 904
		$"../../../Labels/UpgradesOwned/CoolerOwned".position.x = 927
	

func _on_pressed():
	if Globals.servers >= Globals.cooler_dravens_required:
		if Globals.ram_amount >= 75:
			Globals.autoclick_interval -= 0.005
		Globals.total_upgrades_bought += 1
		Globals.cooler_amount += 1
		$"../../../Labels/UpgradesOwned/CoolerOwned".text = "Owned: " + str(Globals.cooler_amount)
		Globals.cooler_click_add_amount += Globals.cooler_multiplier
		Globals.servers -= Globals.cooler_dravens_required
		if get_node_or_null("../../PermanentUpgradeButtons/HBoxPermContainer/RAMPermanent1") != null:
			Globals.cooler_dravens_required *= 4.33
		if get_node_or_null("../../PermanentUpgradeButtons/HBoxPermContainer/RAMPermanent1") == null:
			Globals.cooler_dravens_required *= 1.03
		if Globals.cooler_amount >= 25 and get_node_or_null("../../PermanentUpgradeButtons/HBoxPermContainer/RxamzPermanent2") != null:
			$"../../PermanentUpgradeButtons/HBoxPermContainer/RxamzPermanent2".visible = true
			$"../../../../Dots/CoolerDots/1DotFull".visible = true
		if Globals.cooler_amount == 50:
			$"../../../../Dots/CoolerDots/2DotsFull".visible = true
			$"../../../../AutoClickTimer".start()
		if Globals.cooler_amount == 75:
			$"../../../../Dots/CoolerDots/3DotsFull".visible = true
			for coolers in Globals.cooler_amount:
				Globals.click_add_amount += 10
		if Globals.cooler_amount >= 76:
			Globals.click_add_amount += 10
		$"../../../Labels/UpgradeCosts/CoolerUpgradeCost".text = "Cost: " + str(Globals.format_number(Globals.cooler_dravens_required))
	else:
		pass


func _on_mouse_entered() -> void:
	$"../../../Labels/UpgradeDescriptions/CoolerUpgradeDescription".visible = true

func _on_mouse_exited() -> void:
	$"../../../Labels/UpgradeDescriptions/CoolerUpgradeDescription".visible = false
