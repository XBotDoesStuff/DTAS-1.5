class_name RangedWeapon
extends Weapon

@export var pierce : float
@export var proj_amount : int
@export var proj_scene : PackedScene

@onready var muzzle = get_node("Muzzle")

func _use():
	var projectile = proj_scene.instantiate()
	add_sibling(projectile)
	if muzzle:
		projectile.transform = muzzle.global_transform
	else:
		projectile.transform = global_transform

func _process(delta: float) -> void:
	super._process(delta)
	if muzzle:
		muzzle.look_at(get_global_mouse_position())
