extends CharacterBody2D

var speed = 30 # Speed of the enemy
var health = 30 # Health of the enemy

func _ready():
	add_to_group("Entities")
	$AnimationPlayer.play("walk")
	$Hurtbox.connect("area_entered", Callable(self, "_on_Hurtbox_area_entered"))

func _physics_process(delta):
	var player = get_node("/root/Level Scene/Player")
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()

func _on_Hurtbox_area_entered(area):
	var player = get_node("/root/Level Scene/Player")
	var weapons_node = player.get_node_or_null("Weapons")
	if weapons_node:
		if area.get_parent().get_parent() == weapons_node:
			var damage = 0
			if area.get_parent().name == "FireSpell":
				damage = player.get_node("PlayerStats").FireDamage
			elif area.get_parent().name == "Lance":
				damage = player.get_node("PlayerStats").LanceDamage
			take_damage(damage)

# This function is called by the player's attack when it overlaps with this enemy.
func take_damage(damage_amount):
	print("Took ", damage_amount, " damage")
	health -= damage_amount
	if health <= 0:
		die()

# Handles the death of the enemy.
func die():
	queue_free()

# will remove after
#func _process(delta):
#	print("Current Health: ", health)

