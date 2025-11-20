@tool
class_name Weapon
extends Node2D

@export var weapon_stats : WeaponStats:
	set(value):
		weapon_stats = value
		call_deferred("update_weapon")

var proj_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_weapon()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fire():
	pass

func update_weapon():
	$AnimatedSprite2D.sprite_frames = weapon_stats.sprite
	$AnimatedSprite2D.offset = weapon_stats.offset
	
	if weapon_stats.flip_h:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
	if weapon_stats.flip_v:
		$AnimatedSprite2D.flip_v = true
	else:
		$AnimatedSprite2D.flip_v =false
		
	$Muzzle.position = weapon_stats.muzzle_offset
