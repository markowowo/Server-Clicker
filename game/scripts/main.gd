extends Node2D


func _process(_delta):
	update_server_amount()
	update_sps_amount()
	Globals.sps_amount = Globals.cpu_powerup_dps + Globals.ram_powerup_dps + Globals.hdd_powerup_dps + Globals.gpu_powerup_dps
	
	
func update_server_amount():
	$Control/Labels/UI/ServerAmountLabel.text = "Servers: " + Globals.format_number(Globals.servers)
	
func update_sps_amount():
	$Control/Labels/UI/SPSLabel.text = "SPS: " + Globals.format_number(Globals.sps_amount)

func _on_timer_timeout():
	Globals.add_servers(Globals.cpu_powerup_dps)
	Globals.add_servers(Globals.ram_powerup_dps)
	Globals.add_servers(Globals.hdd_powerup_dps)
	Globals.add_servers(Globals.gpu_powerup_dps)
	update_server_amount()
	Globals.total_time_played += 1
	Globals.total_earned_sps += Globals.cpu_powerup_dps + Globals.ram_powerup_dps + Globals.hdd_powerup_dps + Globals.gpu_powerup_dps
	Globals.total_servers_earned += Globals.cpu_powerup_dps + Globals.ram_powerup_dps + Globals.hdd_powerup_dps + Globals.gpu_powerup_dps
	Globals.total_earned_cpu += Globals.cpu_powerup_dps
	Globals.total_earned_ram += Globals.ram_powerup_dps
	Globals.total_earned_hdd += Globals.hdd_powerup_dps
	Globals.total_earned_gpu += Globals.gpu_powerup_dps
	


func _on_menu_button_pressed() -> void:
	$Menu.visible = true
