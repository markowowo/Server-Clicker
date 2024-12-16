extends Node


# base
var click_add_amount: int = 1
var total_click_add_amount: float
var sps_amount: float = 0
var server_clicks: int
var autoclick_interval: float = 30

# permanent upgrades
var cpu_permanent1_multiplier: float = 1.0
var cpu_permanent1_used: bool = false
var cpu_permanent2_multiplier: float = 1.0
var cpu_permanent2_used: bool = false
var cpu_permanent3_multiplier: float = 1.0
var cpu_permanent3_used: bool = false
var cpu_permanent4_multiplier: float = 1.0
var cpu_permanent4_used: bool = false

var cooler_permanent1_used: bool = false
var cooler_permanent2_used: bool = false
var cooler_permanent3_used: bool = false

var ram_permanent1_multiplier: float = 1.0
var ram_permanent1_used: bool = false
var ram_permanent2_multiplier: float = 1.0
var ram_permanent2_used: bool = false
var ram_permanent3_multiplier: float = 1.0
var ram_permanent3_used: bool = false

var hdd_permanent1_used: bool = false
var hdd_permanent2_multiplier: float = 1.0
var hdd_permanent2_used: bool = false

# totals
var total_time_played: int
var total_times_clicked: int
var total_servers_earned: int
var total_earned_all_clicks: int
var total_earned_base_clicks: int
var total_earned_sps: int
var total_earned_cpu: int
var total_earned_cooler: int
var total_earned_ram: int
var total_earned_hdd: int
var total_earned_gpu: int
var total_upgrades_bought: int
var total_permanent_upgrades_bought: int

# cursor
var cpu_powerup_dps: float
var cpu_multiplier: float = 1.0
var cpu_dravens_required: int = 10
var cpu_amount: int
var cpu_dps_increase: int

# rxamz
var cooler_dravens_required: int = 300
var cooler_amount: int
var cooler_click_add_amount: float = 0
var cooler_multiplier: float = 1.0

# zoltar
var ram_powerup_dps: float
var ram_multiplier: float = 1.0
var ram_dravens_required: int = 1000
var ram_amount: int
var ram_dps_increase: int

# oi
var hdd_powerup_dps: float
var hdd_base_dps: int = 10000
var hdd_multiplier: float = 1.0
var hdd_dravens_required: int = 10000
var hdd_amount: int
var hdd_dps_increase: int

# hitman
var gpu_powerup_dps: float
var gpu_multiplier: float = 1.0
var gpu_dravens_required: int = 5000000
var gpu_amount: int
var gpu_dps_increase: int

var servers: float:
	get:
		return servers
	set(value):
		servers = value


func add_servers(amount):
	servers += amount
	

func format_number(number: float) -> String:
	if number < 1000:
		return str(number)
	elif number < 1_000_000:
		return str(round(number / 1000 * 10) / 10) + "k"
	elif number < 1_000_000_000:
		return str(round(number / 1_000_000 * 10) / 10) + "M"
	elif number < 1_000_000_000_000:
		return str(round(number / 1_000_000_000 * 10) / 10) + "B"
	elif number < 1_000_000_000_000_000:
		return str(round(number / 1_000_000_000_000 * 10) / 10) + "T"
	else:
		return str(round(number / 1_000_000_000_000_000 * 10) / 10) + "Q"
