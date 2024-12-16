extends TextureButton


var labels = []
@onready var stats_button = $"../../../Menu".get_node("StatsButton")
var menu_closed: bool = false


func _ready() -> void:
	randomize()  # Ensure random seed is different each run
	for child in $".".get_children():
		if child is Label:
			labels.append(child)
	

func _on_pressed() -> void:
	if stats_button.disabled == true:
		stats_button.text = "Stats - Unlock from Task"
	if Globals.server_clicks >= 1999 and Globals.cpu_amount >= 50 and $"../../Labels/UI/Task/NextTaskLabel".text == "New Task: Click Server a total of      /2000 times.":
		stats_button.disabled = false
		stats_button.text = "Stats"
		$"../../../ClickCountLabel".visible = false
		var new_task_tween = create_tween()
		new_task_tween.set_parallel(true)
		new_task_tween.tween_property($"../../Labels/UI/Task/NextTaskLabel", "text", "New Task: Unlock Additional Permanent Upgrades", 1.5)
		new_task_tween.tween_property($"../../Labels/UI/Task/TaskRequirementLabel", "text", "Requirement: Read the Credits", 1.5)
		var task_completed_tween = create_tween()
		task_completed_tween.set_parallel(true)
		task_completed_tween.tween_property($"../../Labels/UI/Task/NextTaskLabel", "text", "Task Completed!", 1.5)
		task_completed_tween.tween_property($"../../Labels/UI/Task/TaskRequirementLabel", "text", "", 1.5)
		task_completed_tween.play()
		await task_completed_tween.finished
		new_task_tween.stop()
		new_task_tween.play() 
	Globals.total_earned_cooler += Globals.cooler_click_add_amount
	Globals.total_earned_base_clicks += Globals.click_add_amount
	Globals.total_earned_all_clicks += Globals.cooler_click_add_amount + Globals.click_add_amount
	Globals.total_servers_earned += Globals.cooler_click_add_amount + Globals.click_add_amount
	Globals.total_times_clicked += 1
	$DravenClickParticles.emitting = true
	Globals.server_clicks += 1
	Globals.add_servers(Globals.click_add_amount + Globals.cooler_click_add_amount)
	Globals.total_click_add_amount = Globals.click_add_amount
	Globals.total_click_add_amount += Globals.cooler_click_add_amount

	for label in labels:
		label.text = "+" + str(Globals.total_click_add_amount)

	var children = $".".get_children()  # gets children of button and stores them in a variable

	var random_index = randi() % children.size()  # chooses a random index from the amount of children
	var random_child = children[random_index]  # chooses the child from the chosen index
	random_child.visible = true  # makes the chosen child visible

	if random_child == $Label1:
		$"../AnimationPlayers/AnimationPlayer".play("show click amount")
	if random_child == $Label2:
		$"../AnimationPlayers/AnimationPlayer2".play("show click amount")
	if random_child == $Label3:
		$"../AnimationPlayers/AnimationPlayer3".play("show click amount")
	if random_child == $Label4:
		$"../AnimationPlayers/AnimationPlayer4".play("show click amount")
	if random_child == $Label5:
		$"../AnimationPlayers/AnimationPlayer5".play("show click amount")
	if random_child == $Label6:
		$"../AnimationPlayers/AnimationPlayer6".play("show click amount")
	if random_child == $Label7:
		$"../AnimationPlayers/AnimationPlayer7".play("show click amount")
	if random_child == $Label8:
		$"../AnimationPlayers/AnimationPlayer8".play("show click amount")
	if random_child == $Label9:
		$"../AnimationPlayers/AnimationPlayer9".play("show click amount")
	if random_child == $Label10:
		$"../AnimationPlayers/AnimationPlayer10".play("show click amount")
	if random_child == $Label11:
		$"../AnimationPlayers/AnimationPlayer11".play("show click amount")
	if random_child == $Label12:
		$"../AnimationPlayers/AnimationPlayer12".play("show click amount")
	if random_child == $Label13:
		$"../AnimationPlayers/AnimationPlayer13".play("show click amount")
	if random_child == $Label14:
		$"../AnimationPlayers/AnimationPlayer14".play("show click amount")
	if random_child == $Label15:
		$"../AnimationPlayers/AnimationPlayer15".play("show click amount")
	if random_child == $Label16:
		$"../AnimationPlayers/AnimationPlayer16".play("show click amount")
	if random_child == $Label17:
		$"../AnimationPlayers/AnimationPlayer17".play("show click amount")
	if random_child == $Label18:
		$"../AnimationPlayers/AnimationPlayer18".play("show click amount")
	if random_child == $Label19:
		$"../AnimationPlayers/AnimationPlayer19".play("show click amount")
	if random_child == $Label20:
		$"../AnimationPlayers/AnimationPlayer20".play("show click amount")
	if random_child == $Label21:
		$"../AnimationPlayers/AnimationPlayer21".play("show click amount")
	if random_child == $Label22:
		$"../AnimationPlayers/AnimationPlayer22".play("show click amount")


func _on_auto_click_timer_timeout() -> void:
	$"../../../AutoClickTimer".wait_time = Globals.autoclick_interval 
	_on_pressed()


func _on_credits_credits_opened():
	if Globals.server_clicks >= 1999 and Globals.cpu_amount >= 50:
		$"../PermanentUpgradeButtons/HBoxPermContainer/HDDPermanent2".visible = true
		$"../PermanentUpgradeButtons/HBoxPermContainer/RAMPermanent3".visible = true
		$"../PermanentUpgradeButtons/HBoxPermContainer/CPUPermanent4".visible = true
		$"../PermanentUpgradeButtons/HBoxPermContainer/CoolerPermanent3".visible = true
		$"../../Labels/UpgradesOwned/GPUOwned".visible = true
		$"../../../GPUUpgradeDark".visible = true
		var show_hitman = create_tween()
		show_hitman.set_parallel(true)
		show_hitman.tween_property($"../../Labels/UpgradeDescriptions/GPUUpgradeDescription", "modulate", Color8(255, 255, 255, 255), 2)
		show_hitman.tween_property($"../../../GPUUpgradeDark", "modulate", Color8(255, 255, 255, 255), 2)
		show_hitman.play()
		var new_task_tween = create_tween()
		new_task_tween.set_parallel(true)
		new_task_tween.tween_property($"../../Labels/UI/Task/NextTaskLabel", "text", "All tasks completed.", 1.5)
		new_task_tween.tween_property($"../../Labels/UI/Task/TaskRequirementLabel", "text", "Thanks for playing!", 1.5)
		var task_completed_tween = create_tween()
		task_completed_tween.set_parallel(true)
		task_completed_tween.tween_property($"../../Labels/UI/Task/NextTaskLabel", "text", "Task Completed!", 1.5)
		task_completed_tween.tween_property($"../../Labels/UI/Task/TaskRequirementLabel", "text", "", 1.5)
		task_completed_tween.play()
		await task_completed_tween.finished
		new_task_tween.stop()
		new_task_tween.play()
