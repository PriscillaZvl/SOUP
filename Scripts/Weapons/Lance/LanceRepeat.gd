extends CPUParticles2D

var attack_speed = 1.0

func _ready():
	# Access the PlayerStats and get the AttackSpeed
	var player_stats = get_node_or_null("../../../PlayerStats")
	if player_stats:
		attack_speed = player_stats.AttackSpeed
	else:
		push_error("PlayerStats node not found.")
		return

	# Get the Timer node
	var timer = get_node("Timer")
	timer.wait_time = attack_speed
	timer.timeout.connect(_on_timer_timeout)
	timer.start()

func _on_timer_timeout():
	# Restart the particle emission
	restart_emission()

func restart_emission():
	emitting = true
	restart()
