extends Area2D

var player_stats = null
var timer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	player_stats = get_node("../../../PlayerStats")
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = player_stats.AttackSpeed
	timer.one_shot = false
	timer.autostart = true
	timer.timeout.connect(_on_timer_timeout)

# Deals damage to the entity if inside the area
func _on_timer_timeout():
	for area in get_overlapping_areas():
		if area.is_in_group("Entities"):
			deal_fire_damage(area)

func deal_fire_damage(target):
	# Access the LanceDamage from PlayerStats and apply it to the target
	if target.has_method("take_damage"):
		target.take_damage(player_stats.FireDamage)

	# Apply lifesteal if applicable
	var healthToSteal = floor(player_stats.FireDamage * player_stats.Lifesteal)
	player_stats.Heal(healthToSteal)
