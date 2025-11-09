class_name Projectile
extends CharacterBody2D

@onready var time_created = Time.get_unix_time_from_system()
@export var time_to_live = 5.0
@export var speed = 1000
@export var friendly_projectile : bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity = transform.x * speed * delta
	move_and_collide(velocity)
	
	if Time.get_unix_time_from_system() - time_to_live >= time_created:
		queue_free()
