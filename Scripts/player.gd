extends CharacterBody2D

@export var speed = 400
var screen_size
var mouse_pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

func get_input():
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir * speed

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()

func _process(delta: float) -> void:
	# Decide whether to play animation
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	# Look at mouse
	mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
