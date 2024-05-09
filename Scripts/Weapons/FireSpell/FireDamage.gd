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
	area_entered.connect(_on_Area_Entered)
	
func _on_Area_Entered(area):
	print("Area entered: ", area.name, ", in group 'Entities': ", area.is_in_group("Entities"))
	if area.is_in_group("Entities"):
		print("Entity entered: ", area.name)
		deal_fire_damage(area)


# Deals damage to the entity if inside the area
func _on_timer_timeout():
	print("Timer check, areas overlapping: ", get_overlapping_areas().size())
	for area in get_overlapping_areas():
		if area.is_in_group("Entities") and area.has_method("take_damage"):
			print("Dealt damage!")
			deal_fire_damage(area)

func deal_fire_damage(target):
	var entity = target.get_parent()
	
	# Access Fire Damage from PlayerStats and apply it to the target
	if entity and entity.has_method("take_damage"):
		entity.take_damage(player_stats.FireDamage)
		print("Attempting to deal damage to: ", entity.name)

	# Apply lifesteal if applicable
	var healthToSteal = floor(player_stats.FireDamage * player_stats.Lifesteal)
	player_stats.Heal(healthToSteal)
