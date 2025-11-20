class_name Player
extends CharacterBody2D

@export_category("Movement")
@export var speed = 800.0
@export var dash_speed = 2500.0
@export var dash_length = 0.2
var dash_vector
var is_dashing = false

@export_category("Hunger")
@export var passive_hunger_drain : float
@export var max_hunger : float = 100.0
@onready var hunger = max_hunger

var screen_size
var mouse_pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

func get_input():
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")

func _physics_process(delta: float) -> void:
	if is_dashing:
		velocity = dash_vector * dash_speed
	else:
		velocity = get_input() * speed
	move_and_slide()

func _process(delta: float) -> void:
	# Dash if space is pressed
	if Input.is_action_just_pressed("dash"):
			dash()
	
	# Decide whether to play animation
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	# Look at mouse
	mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)

# Gets the current vector of the player and dashes
func dash():
	print("dashing...")
	is_dashing = true
	dash_vector = get_input()
	$DashTimer.wait_time = dash_length
	$DashTimer.start()

func _on_dash_timer_timeout() -> void:
	is_dashing = false
