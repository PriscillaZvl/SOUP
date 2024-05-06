extends Area2D

func _ready():
	self.body_entered.connect(Callable(self, "_on_body_entered"))

# Increase size by 10% and adjust scale factor
func _on_body_entered(_body: PhysicsBody2D) -> void:

	# Try to get the FireSpell node and increase its scale
	var fire_spell = get_node_or_null("/root/Level Scene/Player/PlayerWeapons/FireSpell")

	if fire_spell:
		fire_spell.scale *= Vector2(1.05, 1.05)
	
		if fire_spell.has_method("set_scale_factor"):
			fire_spell.set_scale_factor(fire_spell.scale.x)

	# Try to get the Lance node and increase its scale
	var lance = get_node_or_null("/root/Level Scene/Player/PlayerWeapons/Lance")

	if lance:
		lance.scale *= Vector2(1.05, 1.05)
	
		if lance.has_method("set_scale_factor"):
			lance.set_scale_factor(lance.scale.x)

	# Delete this node
	self.queue_free()
