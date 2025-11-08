class_name Weapon
extends Node2D

@export var atk_cooldown : float
@export var damage : float
@export var knockback : float
@export var hunger_cost : int

@export var weapon_scene : PackedScene

var last_used_time : float
var can_use : bool = true

func _process(delta: float) -> void:
	pass

func _equip():
	pass

func _unequip():
	pass

func _try_use() -> bool:
	if not can_use:
		return false
	
	if Time.get_unix_time_from_system() - last_used_time < atk_cooldown:
		return false
	
	last_used_time = Time.get_unix_time_from_system()
	_use()
	return true

func _use():
	pass
