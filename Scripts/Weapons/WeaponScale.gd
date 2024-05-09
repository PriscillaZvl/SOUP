extends Node2D

# Syncs CPUParticles2D scale and adjusts particle count based on a single scale variable.

var _scale_factor = 1.0
var last_scale = Vector2()

func _ready():
	last_scale = scale
	
func _process(_delta):
	if scale != last_scale:
		_scale_factor = scale.x
		update_scale()
		last_scale = scale

func update_scale():
	var cpu_particles = get_node_or_null("CPUParticles2D")
	
	if cpu_particles:
		cpu_particles.scale = Vector2(_scale_factor, _scale_factor)
		cpu_particles.amount = int(100 * pow(_scale_factor, 2))
		print("Updated particle count: ", cpu_particles.amount)
