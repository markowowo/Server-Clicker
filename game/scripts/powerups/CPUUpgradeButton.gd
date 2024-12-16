extends TextureButton


func _process(_delta):
	if Globals.cpu_dravens_required > Globals.servers:
		$".".disabled = true
	if Globals.cpu_dravens_required <= Globals.servers:
		$".".disabled = false
	if Globals.cpu_dravens_required >= 100:
		$"../../../../ServerButtonImage".position.x = 894
		$"../../../Labels/UpgradesOwned/CPUOwned".position.x = 922
		

func _on_pressed():
	if Globals.servers >= Globals.cpu_dravens_required:
		if Globals.ram_amount >= 75:
			Globals.autoclick_interval -= 0.005
		Globals.servers -= Globals.cpu_dravens_required
		
		if get_node_or_null("../../PermanentUpgradeButtons/HBoxPermContainer/RAMPermanent1") != null:
			Globals.cpu_dravens_required *= 1.192
		if get_node_or_null("../../PermanentUpgradeButtons/HBoxPermContainer/RAMPermanent1") != null and Globals.cpu_amount == 50:
			Globals.cpu_dravens_required *= 1.1324
		if get_node_or_null("../../PermanentUpgradeButtons/HBoxPermContainer/RAMPermanent1") == null:
			Globals.cpu_dravens_required *= 1.1
		if get_node_or_null("../../PermanentUpgradeButtons/HBoxPermContainer/RAMPermanent1") == null and Globals.cpu_amount == 50:
			Globals.cpu_dravens_required *= 1.045
			
		Globals.total_upgrades_bought += 1
		Globals.cpu_amount += 1
		Globals.cpu_dps_increase += 1
		$"../../../Labels/UpgradesOwned/CPUOwned".text = "Owned: " + str(Globals.cpu_amount)
		
		if Globals.cpu_amount == 20:
			$"../../../../RAMUpgradeDark".visible = true
			var show_zoltar = create_tween()
			show_zoltar.set_parallel(true)
			show_zoltar.tween_property($"../RAMUpgradeButton", "modulate", Color8(255, 255, 255, 255), 2)
			show_zoltar.tween_property($"../../../../RAMUpgradeDark", "modulate", Color8(255, 255, 255, 255), 2)
			show_zoltar.play()
			var new_task_tween = create_tween()
			new_task_tween.set_parallel(true)
			new_task_tween.tween_property($"../../../Labels/UI/Task/NextTaskLabel", "text", "New Task: Buy 50 CPUs", 1.5)
			new_task_tween.tween_property($"../../../Labels/UI/Task/TaskRequirementLabel", "text", "Reward: 10x Click Power", 1.5)
			var task_completed_tween = create_tween()
			task_completed_tween.set_parallel(true)
			task_completed_tween.tween_property($"../../../Labels/UI/Task/NextTaskLabel", "text", "Task Completed!", 1.5)
			task_completed_tween.tween_property($"../../../Labels/UI/Task/TaskRequirementLabel", "text", "", 1.5)
			task_completed_tween.play()
			await task_completed_tween.finished
			new_task_tween.stop()
			new_task_tween.play()
			
		if Globals.cpu_amount == 50:
			Globals.click_add_amount *= 10
			$"../../PermanentUpgradeButtons/HBoxPermContainer/RAMPermanent2".visible = true
			$"../../../../HDDUpgradeDark".visible = true
			$"../../../Labels/UpgradeDescriptions/HDDUpgradeDescription".visible = true
			var show_oi = create_tween()
			show_oi.set_parallel(true)
			show_oi.tween_property($"../../../Labels/UpgradeDescriptions/HDDUpgradeDescription", "modulate", Color8(255, 255, 255, 255), 2)
			show_oi.tween_property($"../../../../HDDUpgradeDark", "modulate", Color8(255, 255, 255, 255), 2)
			show_oi.play()
			var new_task_tween = create_tween()
			new_task_tween.set_parallel(true)
			new_task_tween.tween_property($"../../../Labels/UI/Task/NextTaskLabel", "text", "New Task: Click Server a total of      /2000 times.", 1.5)
			new_task_tween.tween_property($"../../../Labels/UI/Task/TaskRequirementLabel", "text", "Reward: Unlock Stats", 1.5)
			var task_completed_tween = create_tween()
			task_completed_tween.set_parallel(true)
			task_completed_tween.tween_property($"../../../Labels/UI/Task/NextTaskLabel", "text", "Task Completed!", 1.5)
			task_completed_tween.tween_property($"../../../Labels/UI/Task/TaskRequirementLabel", "text", "", 1.5)
			task_completed_tween.play()
			await task_completed_tween.finished
			new_task_tween.stop()
			new_task_tween.play() 
			await new_task_tween.finished
			$"../../../../ClickCountLabel".visible = true
			
		if Globals.cpu_amount >= 20:
			if is_instance_valid($"../../PermanentUpgradeButtons/HBoxPermContainer"):
				$"../../../Labels/UI/PermanentUpgradesLabel".visible = true
				$"../../PermanentUpgradeButtons/HBoxPermContainer".visible = true
				var show_permanent_upgrades = create_tween()
				show_permanent_upgrades.set_parallel(true)
				show_permanent_upgrades.tween_property($"../../../Labels/UI/PermanentUpgradesLabel", "modulate", Color8(255, 255, 255 ,255), 0.7)
				show_permanent_upgrades.tween_property($"../../PermanentUpgradeButtons/HBoxPermContainer", "modulate", Color8(255, 255, 255 ,255), 0.7)
				show_permanent_upgrades.play()
			else:
				pass
		
		if get_node_or_null("../../PermanentUpgradeButtons/HBoxPermContainer/RAMPermanent1") == null:
			if Globals.cpu_amount >= 25:
				$"../../../../Dots/CPUDots/1DotFull".visible = true
			if Globals.cpu_amount >= 50:
				$"../../../../Dots/CPUDots/2DotsFull".visible = true
			if Globals.cpu_amount >= 75 and get_node_or_null("../../PermanentUpgradeButtons/HBoxPermContainer/CPUPermanent3") != null:
				$"../../PermanentUpgradeButtons/HBoxPermContainer/CPUPermanent3".visible = true
				$"../../../../Dots/CPUDots/3DotsFull".visible = true
			if Globals.cpu_amount >= 100:
				$"../../../../Dots/CPUDots/4DotsFull".visible = true
			if Globals.cpu_amount >= 125:
				$"../../../../Dots/CPUDots/5DotsFull".visible = true
		$"../../../Labels/UpgradeCosts/CPUUpgradeCost".text = "Cost: " + str(Globals.format_number(Globals.cpu_dravens_required))
		
	else:
		pass


func _on_mouse_entered() -> void:
	$"../../../Labels/UpgradeDescriptions/CPUUpgradeDescription".visible = true


func _on_mouse_exited() -> void:
	$"../../../Labels/UpgradeDescriptions/CPUUpgradeDescription".visible = false


func _on_zoltar_permanent_1_zoltar_permanent_bought() -> void:
	if Globals.cpu_amount >= 25:
		Globals.cpu_multiplier *= 1.05
