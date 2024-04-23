extends CharacterBody2D

var speed = 100

func _ready():
	add_to_group("Entities")

func _physics_process(delta):
	var player = get_node("/root/Level Scene/Player")
	var direction = (player.global_position - global_position).normalized()
	move_and_slide()
