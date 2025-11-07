extends Area2D

@export var bullet_speed = 1000
@export var time_to_live = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	$TtlTimer.wait_time = time_to_live
	$TtlTimer.start()

func _process(delta: float) -> void:
	position += transform.x * bullet_speed * delta

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		queue_free()

func _on_ttl_timer_timeout() -> void:
	queue_free()
