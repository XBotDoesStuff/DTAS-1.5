class_name Bullet
extends Area2D

var stats : WeaponStats

func _physics_process(delta: float) -> void:
	position += transform.x * delta * stats.proj_speed
