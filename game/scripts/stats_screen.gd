extends Control



func _on_back_button_pressed() -> void:
	$".".visible = false


func _on_dps_timer_timeout() -> void:	
	$StatsLabels/TimePlayed.text = "Time Played: " + str(Globals.total_time_played) + "s"
	$StatsLabels/TimesClicked.text = "Times Clicked: " + str(Globals.format_number(Globals.total_times_clicked))
	$StatsLabels/UpgradesBought.text = "Upgrades Bought: " + str(Globals.format_number(Globals.total_upgrades_bought))
	$StatsLabels/PermanentUpgradesBought.text = "Permanent Upgrades Bought: " + str(Globals.total_permanent_upgrades_bought)
	$StatsLabels/EarnedFromCPU.text = "Earned from CPU: " + str(Globals.format_number(Globals.total_earned_cpu))
	$StatsLabels/EarnedFromCooler.text = "Earned from Cooler: " + str(Globals.format_number(Globals.total_earned_cooler))
	$StatsLabels/EarnedFromGPU.text = "Earned from GPU: " + str(Globals.format_number(Globals.total_earned_ram))
	$StatsLabels/EarnedFromHDD.text = "Earned from HDD: " + str(Globals.format_number(Globals.total_earned_hdd))
	$StatsLabels/EarnedFromGPU.text = "Earned from GPU: " + str(Globals.format_number(Globals.total_earned_gpu))
	$StatsLabels/ServersEarned.text = "Total Earned: " + str(Globals.format_number(Globals.total_servers_earned))
	$StatsLabels/ServersEarnedSPS.text = "Total Earned - SPS: " + str(Globals.format_number(Globals.total_earned_sps))
	$StatsLabels/ServersEarnedClicks.text = "Total Earned - Clicks: " + str(Globals.format_number(Globals.total_earned_all_clicks))
	
