class_name WeaponStats
extends Resource

@export_category("Positioning")
@export var sprite : SpriteFrames
@export var sprite_scale : Vector2
@export var offset : Vector2
@export var flip_v : bool
@export var flip_h : bool
@export var muzzle_offset : Vector2

@export_category("Projectiles")
@export var proj_scene : PackedScene
@export var proj_count : int
@export var proj_force : float
@export var proj_range : float

@export_category("Stats")
@export var damage : float
@export var pierce : int
@export var fire_rate : float
