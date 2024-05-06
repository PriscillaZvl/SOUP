extends Area2D

func _ready():
	self.body_entered.connect(Callable(self, "_on_body_entered"))

func _on_body_entered(_body: PhysicsBody2D) -> void:
	# Access the PlayerStats node
	var player_stats = get_node_or_null("/root/Level Scene/Player/PlayerStats")
	
	if player_stats:
		var current_attack_speed = player_stats.GetAttackSpeed()
		# Calculate the new attack speed to make it faster
		var new_attack_speed = current_attack_speed * 0.95  # Decrease interval to speed up attacks
		player_stats.SetAttackSpeed(new_attack_speed)
	
	# Delete this item
	self.queue_free()
