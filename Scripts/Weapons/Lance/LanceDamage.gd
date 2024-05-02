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
	area_entered.connect(_on_area_entered)

# Called when an area enters the Area2D
func _on_area_entered(area):
	if area.is_in_group("Entities"):
		timer.start()

# Deals damage to the entity
func _on_timer_timeout():
	for area in get_overlapping_areas():
		if area.is_in_group("Entities"):
			deal_lance_damage(area)

func deal_lance_damage(target):
	# Access the LanceDamage from PlayerStats and apply it to the target
	if target.has_method("take_damage"):
		target.take_damage(player_stats.LanceDamage)

	# Apply lifesteal if applicable
	var healthToSteal = floor(player_stats.LanceDamage * player_stats.Lifesteal)
	player_stats.Heal(healthToSteal)
