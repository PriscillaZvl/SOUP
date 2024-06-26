extends CharacterBody2D

var speed = 20 # Speed of the enemy
var health = 10 # Health of the enemy

func _ready():
	add_to_group("Entities")
	$AnimationPlayer.play("Flying")
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
	
	var chance = randf_range(0, 100)
	
	if chance <= 5:
		var item_path = ""
		
		if randf_range(0, 1) < 0.5:
			item_path = "res://Objects/Items/item_attack_speed.tscn"
		else:
			item_path = "res://Objects/Items/item_scale_up.tscn"
		
		var item_scene = load(item_path)
		
		if item_scene and item_scene is PackedScene:
			var item = item_scene.instantiate()
			
			if self is Node2D:
				item.position = self.position
			
			get_parent().add_child(item)
			
		else:
			print("Failed to load: ", item_path)

# will remove after
#func _process(delta):
#	print("Current Health: ", health)

