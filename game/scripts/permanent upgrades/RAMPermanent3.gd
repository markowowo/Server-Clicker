extends TextureButton


func _on_pressed():
	if Globals.servers >= 10_000_000:
		Globals.total_permanent_upgrades_bought += 1
		Globals.servers -= 10_000_000
		Globals.ram_permanent3_multiplier = 100
		$"../../../UpgradeButtons/GPUUpgradeButton".visible = true
		$"../../../UpgradeButtons/GPUUpgradeButton/RevealGPUParticles".emitting = true
		$"../../../../../GPUUpgradeDark".visible = false
		$"../../../../Labels/UpgradeDescriptions/GPUUpgradeDescription".visible = false
		$"../../../../Labels/UpgradeDescriptions/GPUUpgradeDescription".set("theme_override_font_sizes/font_size", 30)
		$"../../../../Labels/UpgradeDescriptions/GPUUpgradeDescription".set("theme_override_colors/font_shadow_color", false)
		$"../../../../Labels/UpgradeDescriptions/GPUUpgradeDescription".set("theme_override_colors/font_outline_color", false)
		$"../../../../Labels/UpgradeDescriptions/GPUUpgradeDescription".set("theme_override_constants/outline_size", 2)
		$"../../../../Labels/UpgradeDescriptions/GPUUpgradeDescription".text = "The GPU creates a base of 500000 DPS, affected by Permanent Upgrades."
		$"../../../../Labels/UpgradeDescriptions/GPUUpgradeDescription".top_level = true
		$"../../../../Labels/UpgradeDescriptions/GPUUpgradeDescription".position = Vector2(801, 506)
		$"../../../UpgradeButtons/GPUUpgradeButton".visible = true
		$"../../../../Labels/UpgradesOwned/GPUOwned".visible = true
		$"../../../../Labels/UpgradeCosts/GPUUpgradeCost".visible = true
		$"../../../../../ServerButtonImage5".visible = true
		$"../../../../../Dots/GPUDots/5DotsEmpty".visible = true
		$"../../../../../Dots/GPUDots/GPUDotsInfoHover".visible = true
		$"../GPUPermanent1".visible = true
		Globals.ram_permanent3_used = true
		queue_free()


func _on_mouse_entered():
	$RAMPermanentUpgrade3Description.visible = true


func _on_mouse_exited():
	$RAMPermanentUpgrade3Description.visible = false
