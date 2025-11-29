class_name Player
extends Character

@export var stats : PlayerStats

var dashing : bool = false
var last_dir : Vector2

func get_input() -> Vector2:
	var input : Vector2
	input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	return input

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("dash") and not dashing:
		dash()

func _physics_process(_delta: float) -> void:
	if not dashing:
		velocity = stats.move_speed * get_input()
	else:
		velocity = stats.dash_speed * last_dir
	
	if not dashing:
		look_at(get_global_mouse_position())
	
	move_and_slide()


func dash():
	last_dir = get_input()
	dashing = true
	
	$DashTimer.start(stats.dash_length)

func dash_ended():
	dashing = false
	
