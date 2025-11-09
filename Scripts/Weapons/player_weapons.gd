extends Node2D

@export var weapon_to_equip : PackedScene

var current_weapon : Weapon
var secondary_weapon : Weapon
var weapon_temp : Weapon

@onready var player = $".."

func _ready():
	if weapon_to_equip:
		equip_weapon(weapon_to_equip)

func _process(delta: float) -> void:
	pass

func equip_weapon(weapon_scene : PackedScene):
	print("equipping " + str(weapon_scene))
	# If the player has a primary but no seconday, moves the primary to the secondary slot
	if current_weapon and not secondary_weapon:
		current_weapon = secondary_weapon
		current_weapon._unequip()
		current_weapon.queue_free()
	
	# If a player has two weapons already, drops the current weapon to make room
	elif current_weapon and secondary_weapon:
		drop_current_weapon()
	
	# Instantiate the new weapon
	current_weapon = weapon_scene.instantiate()
	add_child(current_weapon)
	current_weapon.global_position = global_position
	current_weapon._equip()

# Swaps the current and primary weapons
func swap_weapon():
	weapon_temp = current_weapon
	current_weapon._unequip()
	current_weapon.queue_free()
	equip_weapon(secondary_weapon.weapon_scene)
	secondary_weapon = weapon_temp

# This function currently just destroys the current weapon. This might be changed later.
func drop_current_weapon():
	current_weapon._unequip()
	current_weapon.queue_free()
