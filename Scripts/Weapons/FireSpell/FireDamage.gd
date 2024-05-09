extends Area2D

var player_stats = null
var timer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	var weapon_repeat = get_node("/root/Level Scene/Player/PlayerWeapons/FireSpell/CPUParticles2D")
	weapon_repeat.connect("attack_performed", Callable(self, "_on_Attack_Performed"))
	player_stats = get_node("/root/Level Scene/Player/PlayerStats")
	
func _on_Attack_Performed():
	for area in get_overlapping_areas():
		if area.is_in_group("Entities"):
			deal_fire_damage(area.get_parent())

func deal_fire_damage(target):
	
	# Access Fire Damage from PlayerStats and apply it to the target
	if target:
		target.take_damage(player_stats.FireDamage)
		print("Attempting to deal damage to: ", target.name)

	# Apply lifesteal if applicable
	var healthToSteal = floor(player_stats.FireDamage * player_stats.Lifesteal)
	player_stats.Heal(healthToSteal)
	
