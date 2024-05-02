extends Area2D

func _ready():
	self.body_entered.connect(Callable(self, "_on_body_entered"))

# Increase size by 10% and delete self
func _on_body_entered(_body: PhysicsBody2D) -> void:
	# Try to get the FireSpell node
	var fire_spell = get_node_or_null("/root/Level Scene/Player/PlayerWeapons/FireSpell")
	if fire_spell:
		fire_spell.scale *= Vector2(1.1, 1.1)  # Scale up by 10%

	# Try to get the Lance node
	var lance = get_node_or_null("/root/Level Scene/Player/PlayerWeapons/Lance")
	if lance:
		lance.scale *= Vector2(1.1, 1.1)  # Scale up by 10%

	# Delete this node
	self.queue_free()
