@tool
extends Node2D

@export var weapon_stats : WeaponStats:
	set(value):
		weapon_stats = value
		call_deferred("update_visuals")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_visuals()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_visuals():
	$AnimatedSprite2D.sprite_frames = weapon_stats.sprite
	$AnimatedSprite2D.offset = weapon_stats.offset
	$Muzzle.position = weapon_stats.muzzle_offset
