@tool
extends Node2D

@export var weapon_stats : WeaponStats

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_weapon_stats(weapon_stats)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func load_weapon_stats(stats : WeaponStats):
	var sprite = stats.sprite
	var sprite_offset = stats.offset
	
	var proj_count = stats.proj_count
	var pierce = stats.pierce
	var fire_rate = stats.fire_rate
	var proj_force = stats.proj_force
	var proj_range = stats.proj_range
	
	$AnimatedSprite2D.sprite_frames = sprite
