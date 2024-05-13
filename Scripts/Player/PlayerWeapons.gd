extends Node


var fire_spell
var lance
var player_stats

func _ready():
	player_stats = get_node("/root/Level Scene/Player/PlayerStats")
	fire_spell = get_node("/root/Level Scene/Player/PlayerWeapons/FireSpell")
	lance = get_node("/root/Level Scene/Player/PlayerWeapons/Lance")
	
	update_weapon_states()
	
# Literally deletes the disabled weapon
func update_weapon_states():
	if player_stats:
		if not player_stats.FireSpell and fire_spell:
			fire_spell.queue_free()
			fire_spell = null
		if not player_stats.Lance and lance:
			lance.queue_free()
			lance = null
		
func _process(delta):
	update_weapon_states()
