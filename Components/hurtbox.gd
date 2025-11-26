class_name Hurtbox
extends Area2D

@export var shape : Shape2D
@onready var owner_hp : HealthComponent = get_parent()
@onready var player_hurtbox : bool = owner.is_in_group("player")

func _ready():
	monitoring = false
	
	if player_hurtbox:
		set_collision_layer_value(1, false)
		set_collision_mask_value(1, false)

		set_collision_layer_value(2, true)
		set_collision_mask_value(2, true)

func recieve_hit(damage : float):
	owner_hp.take_damage(damage)
