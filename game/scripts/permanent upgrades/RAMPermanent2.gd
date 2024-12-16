extends TextureButton


func _on_pressed():
	if Globals.servers >= 5_000_000:
		Globals.ram_permanent2_multiplier = 10
		$"../../../UpgradeButtons/HDDUpgradeButton".visible = true
		$"../../../UpgradeButtons/HDDUpgradeButton/RevealHDDParticles".emitting = true
		$"../../../../../HDDUpgradeDark".visible = false
		$"../../../../Labels/UpgradeDescriptions/HDDUpgradeDescription".visible = false
		$"../../../../Labels/UpgradeDescriptions/HDDUpgradeDescription".set("theme_override_font_sizes/font_size", 30)
		$"../../../../Labels/UpgradeDescriptions/HDDUpgradeDescription".set("theme_override_colors/font_shadow_color", false)
		$"../../../../Labels/UpgradeDescriptions/HDDUpgradeDescription".set("theme_override_colors/font_outline_color", false)
		$"../../../../Labels/UpgradeDescriptions/HDDUpgradeDescription".set("theme_override_constants/outline_size", 2)
		$"../../../../Labels/UpgradeDescriptions/HDDUpgradeDescription".text = "HDD stores a base of 10000 SPS, affected by Permanent Upgrades."
		$"../../../../Labels/UpgradeDescriptions/HDDUpgradeDescription".position = Vector2(813, 410)
		$"../../../UpgradeButtons/HDDUpgradeButton".visible = true
		$"../../../../Labels/UpgradesOwned/HDDOwned".visible = true
		$"../../../../Labels/UpgradeCosts/HDDUpgradeCost".visible = true
		$"../../../../../ServerButtonImage4".visible = true
		$"../../../../../Dots/HDDDots/5DotsEmpty".visible = true
		$"../../../../../Dots/HDDDots/HDDDotsInfoHover".visible = true
		$"../HDDPermanent1".visible = true
		Globals.ram_permanent2_used = true
		queue_free()
		
func _on_mouse_entered():
	$RAMPermanentUpgrade2Description.visible = true


func _on_mouse_exited():
	$RAMPermanentUpgrade2Description.visible = false
