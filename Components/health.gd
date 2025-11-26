class_name HealthComponent
extends Node

signal health_changed(diff)
signal health_depleted

@export var max_health : float = 100.0
@onready var health : float = max_health: set = set_health

func set_health(value):
	var og_health = health
	health = clamp(health, 0, max_health)
	var diff = health - og_health
	health_changed.emit(diff)
	if health == 0:
		health_depleted.emit()

func take_damage(value):
	health -= value
