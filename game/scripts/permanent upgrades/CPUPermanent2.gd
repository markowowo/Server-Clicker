extends TextureButton


func _on_pressed():
	if Globals.servers >= 25000:
		$"../RAMPermanent1".visible = true
		Globals.total_permanent_upgrades_bought += 1
		Globals.cpu_permanent2_multiplier = 100
		Globals.cpu_powerup_dps = Globals.cpu_amount * Globals.cpu_multiplier * Globals.cpu_permanent1_multiplier * Globals.cpu_permanent2_multiplier
		Globals.servers -= 25000
		$"../../../UpgradeButtons/RAMUpgradeButton/RevealRAMParticles".emitting = true
		$"../../../../../RAMUpgradeDark".visible = false
		$"../../../UpgradeButtons/RAMUpgradeButton".visible = true
		$"../../../../Labels/UpgradeDescriptions/RAMUpgradeDescription".visible = false
		$"../../../../Labels/UpgradeDescriptions/RAMUpgradeDescription".set("theme_override_font_sizes/font_size", 30)
		$"../../../../Labels/UpgradeDescriptions/RAMUpgradeDescription".set("theme_override_colors/font_shadow_color", false)
		$"../../../../Labels/UpgradeDescriptions/RAMUpgradeDescription".set("theme_override_colors/font_outline_color", false)
		$"../../../../Labels/UpgradeDescriptions/RAMUpgradeDescription".set("theme_override_constants/outline_size", 2)
		$"../../../../Labels/UpgradeDescriptions/RAMUpgradeDescription".text = "RAM creates a base of 100 SPS, affected by Permanent Upgrades."
		$"../../../../Labels/UpgradeDescriptions/RAMUpgradeDescription".position = Vector2(800, 296)
		$"../../../../Labels/UpgradeCosts/RAMUpgradeCost".visible = true
		$"../../../../Labels/UpgradesOwned/RAMOwned".visible = true
		$"../../../../../ServerButtonImage3".visible = true
		Globals.cpu_permanent2_used = true
		queue_free()
	else:
		pass

func _on_mouse_entered():
	$CPUPermanentUpgrade2Description.visible = true


func _on_mouse_exited():
	$CPUPermanentUpgrade2Description.visible = false
