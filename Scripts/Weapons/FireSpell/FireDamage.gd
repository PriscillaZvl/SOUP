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

# Called every frame
func _on_area_entered(area):
	if area.is_in_group("Entities"):
		timer.start()

# Deals damage to the entity
func _on_timer_timeout():
	for area in get_overlapping_areas():
		if area.is_in_group("Entities"):
			player_stats.DealDamage(area)
