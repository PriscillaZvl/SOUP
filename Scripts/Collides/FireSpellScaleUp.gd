extends Area2D

func _ready():
	self.body_entered.connect(Callable(self, "_on_body_entered"))

# Increase size by 10%
func _on_body_entered(_body: PhysicsBody2D) -> void:
	var fire_scale = get_node("/root/Level Scene/Player/PlayerWeapons/FireSpell")
	fire_scale.scale_factor *= 1.1
