class_name Hitbox
extends Area2D

var attack_stats : AttackStats
var time_to_live : float
var shape : Shape2D

func _init(_attack_stats, _time_to_live, _shape):
	attack_stats = _attack_stats
	time_to_live = _time_to_live
	shape = _shape

func _ready() -> void:
	monitorable = false
	area_entered.connect(_on_area_entered)
	
	if time_to_live > 0.0:
		var life_timer = Timer.new()
		add_child(life_timer)
		life_timer.timeout.connect(queue_free)
		life_timer.call_deferred("start", time_to_live)
	
	if shape:
		var collision_shape = CollisionShape2D.new()
		collision_shape.shape = shape
		add_child(collision_shape)
	
	if not attack_stats.player_friendly:
		set_collision_layer_value(1, false)
		set_collision_mask_value(1, false)
		
		set_collision_layer_value(2, true)
		set_collision_mask_value(2, true)

func _on_area_entered(area : Area2D):
	if not area.has_method("recieve_hit"):
		return
	
	area.recieve_hit(attack_stats.damage)
