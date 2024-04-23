extends Node2D

var _scale_factor = 1.0
var scale_factor:
	get:
		return _scale_factor
	set(value):
		_scale_factor = value
		update_scale()

func _ready():
	var collision_node = get_node("CollisionShape2D").get_parent()
	collision_node.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	scale_factor += 2

func update_scale():
	var cpu_particles = get_node("CPUParticles2D")
	var collision_shape = get_node("CollisionShape2D")

	cpu_particles.scale = Vector2(_scale_factor, _scale_factor)
	cpu_particles.amount = int(100 * _scale_factor)

	collision_shape.scale = Vector2(_scale_factor, _scale_factor)
