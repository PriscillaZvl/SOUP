extends CPUParticles2D

signal attack_performed

func _ready():
	# Access the PlayerStats and get the AttackSpeed
	var player_stats = get_node_or_null("/root/Level Scene/Player/PlayerStats")
	if player_stats:
		update_attack_interval(player_stats.AttackSpeed)
		player_stats.connect("AttackSpeedChanged", Callable(self, "update_attack_interval"))
	else:
		push_error("PlayerStats node not found.")
		return

	# Start emitting immediately
	emitting = true
	
	var timer = get_node_or_null("Timer")
	timer.wait_time = player_stats.AttackSpeed
	timer.autostart = true
	timer.one_shot = false
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))

func update_attack_interval(attack_speed):
	var timer = get_node("Timer")
	timer.wait_time = attack_speed
	timer.start()
	lifetime = attack_speed

func _on_timer_timeout():
	emitting = false
	await get_tree().create_timer(0.01).timeout
	emitting = true
	emit_signal("attack_performed")
	print("Attacking!")

