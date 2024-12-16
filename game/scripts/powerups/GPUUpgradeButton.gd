extends TextureButton

@onready var cpu_permanent1 = $"../../PermanentUpgradeButtons/HBoxPermContainer/CPUPermanent1"
@onready var cpu_permanent2 = $"../../PermanentUpgradeButtons/HBoxPermContainer/CPUPPermanent2"
@onready var cpu_permanent3 = $"../../PermanentUpgradeButtons/HBoxPermContainer/CPUPermanent3"
@onready var cpu_permanent4 = $"../../PermanentUpgradeButtons/HBoxPermContainer/CPUPermanent4"
@onready var cooler_permanent1 = $"../../PermanentUpgradeButtons/HBoxPermContainer/CoolerPermanent1"
@onready var cooler_permanent2 = $"../../PermanentUpgradeButtons/HBoxPermContainer/CoolerPermanent2"
@onready var cooler_permanent3 = $"../../PermanentUpgradeButtons/HBoxPermContainer/CoolerPermanent3"
@onready var ram_permanent1 = $"../../PermanentUpgradeButtons/HBoxPermContainer/RAMPermanent1"
@onready var ram_permanent2 = $"../../PermanentUpgradeButtons/HBoxPermContainer/RAMPermanent2"
@onready var ram_permanent3 = $"../../PermanentUpgradeButtons/HBoxPermContainer/RAMPermanent3"
@onready var hdd_permanent1 = $"../../PermanentUpgradeButtons/HBoxPermContainer/HDDPermanent1"
@onready var hdd_permanent2 = $"../../PermanentUpgradeButtons/HBoxPermContainer/HDDPermanent2"

func _process(delta):
	if Globals.gpu_dravens_required > Globals.servers:
		$".".disabled = true
	if Globals.gpu_dravens_required <= Globals.servers:
		$".".disabled = false
	if Globals.gpu_amount >= 1:
		if cpu_permanent1 == null and Globals.cpu_permanent1_used == true:
			Globals.cpu_permanent1_multiplier = 20
		if cpu_permanent2 == null and Globals.cpu_permanent2_used == true:
			Globals.cpu_permanent2_multiplier = 200
		if cpu_permanent3 == null and Globals.cpu_permanent3_used == true:
			Globals.cpu_permanent3_multiplier = 4
		if cpu_permanent4 == null and Globals.cpu_permanent4_used == true:
			Globals.cpu_permanent4_multiplier = 8
		if ram_permanent1 == null and Globals.ram_permanent1_used == true:
			Globals.ram_permanent1_multiplier = 20
		if ram_permanent2 == null and Globals.ram_permanent2_used == true:
			Globals.ram_permanent2_multiplier = 20
		if ram_permanent3 == null and Globals.ram_permanent3_used == true:
			Globals.ram_permanent3_multiplier = 200
		if hdd_permanent2 == null and Globals.hdd_permanent2_used == true:
			Globals.hdd_permanent2_multiplier = 20
	Globals.hdd_powerup_dps = Globals.hdd_dps_increase * Globals.hdd_multiplier * Globals.hdd_permanent2_multiplier
	Globals.ram_powerup_dps = Globals.ram_dps_increase * Globals.ram_multiplier * Globals.ram_permanent1_multiplier * Globals.ram_permanent2_multiplier * Globals.ram_permanent3_multiplier
	Globals.cpu_powerup_dps = Globals.cpu_dps_increase * Globals.cpu_multiplier * Globals.cpu_permanent1_multiplier * Globals.cpu_permanent2_multiplier * Globals.cpu_permanent3_multiplier * Globals.cpu_permanent4_multiplier

func _on_pressed():
	if Globals.servers >= Globals.gpu_dravens_required:
		Globals.total_upgrades_bought += 1
		Globals.gpu_amount += 1
		Globals.gpu_dps_increase += 0
		$"../../../Labels/UpgradesOwned/GPUOwned".text = "Owned: " + str(Globals.gpu_amount)
		Globals.gpu_powerup_dps = Globals.gpu_dps_increase * Globals.gpu_multiplier
		Globals.servers -= Globals.gpu_dravens_required
		Globals.gpu_dravens_required *= 1.356
		$"../../../Labels/UpgradeCosts/GPUUpgradeCost".text = "Cost: " + str(Globals.format_number(Globals.gpu_dravens_required))
		if Globals.gpu_amount == 25:
			Globals.cpu_multiplier *= 4.33
			Globals.ram_multiplier *= 4.33
			Globals.hdd_multiplier *= 4.33
			Globals.gpu_multiplier *= 4.33
		if Globals.gpu_amount == 50:
			Globals.cpu_dravens_required *= (1 / 1.045) * 1.010
			Globals.ram_dravens_required *= (1 / 1.059) * 1.027
			Globals.hdd_dravens_required *= (1 / 1.122) * 1.088
			Globals.gpu_dravens_required *= (1 / 1.356) * 1.315
		if Globals.gpu_amount == 1:
			if cooler_permanent1 == null and Globals.cooler_permanent1_used == true:
				Globals.click_add_amount *= 2
			if cooler_permanent2 == null and Globals.cooler_permanent2_used == true:
				Globals.cooler_click_add_amount *= 2
				Globals.cooler_multiplier *= 2
			if cooler_permanent3 == null and Globals.cooler_permanent3_used == true:
				Globals.cooler_click_add_amount *= 8
				Globals.cooler_multiplier *= 8
			if hdd_permanent1 == null and Globals.hdd_permanent1_used == true:
				Globals.hdd_base_dps *= 2
				for hdds in Globals.hdd_amount:
					Globals.hdd_dps_increase += Globals.hdd_base_dps
				
				
func _on_mouse_entered():
	$"../../../Labels/UpgradeDescriptions/GPUUpgradeDescription".visible = true


func _on_mouse_exited():
	$"../../../Labels/UpgradeDescriptions/GPUUpgradeDescription".visible = false
