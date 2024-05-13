extends Node2D

# Generic function to spawn enemies
func spawn_enemy(enemy_path, position_node_path):
	
	var enemy_scene = load(enemy_path).instantiate()
	var path_follow_node = get_node_or_null(position_node_path)
	if path_follow_node:
		path_follow_node.progress_ratio = randf()
		enemy_scene.global_position = path_follow_node.global_position
		add_child(enemy_scene)
		print(enemy_scene.name, " spawned at position: ", enemy_scene.global_position)

# Function to handle timer timeout
func _on_timer_timeout():
	spawn_enemy("res://Objects/Characters/caster.tscn", "Path2D/PathFollow2D")
	spawn_enemy("res://Objects/Characters/sniper.tscn", "Path2D/PathFollow2D")
	spawn_enemy("res://Objects/Characters/buffer.tscn", "Path2D/PathFollow2D")
	# You can add more enemy types as needed
