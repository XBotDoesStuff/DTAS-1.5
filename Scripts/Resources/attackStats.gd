class_name AttackStats
extends Resource

@export var damage : float
@export var player_friendly : bool

func _init(_damage : float, _player_friendly : bool):
	damage = _damage
	player_friendly = _player_friendly
