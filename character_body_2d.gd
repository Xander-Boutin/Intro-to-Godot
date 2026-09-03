extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var start_position : Vector2
var jumps = 1
var big_jump : bool = false
var current_door
var current_button
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _ready() -> void:
	start_position = global_position

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and is_on_floor():
		if big_jump == true:
			velocity.y = JUMP_VELOCITY * 2
			big_jump = false
		else:
			velocity.y = JUMP_VELOCITY
	
	if event.is_action_pressed("interact"):
		if current_door != null:
			current_door.change_scene()
		if current_button != null:
			current_button.remove_wall()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		sprite_2d.play("walk")
		if direction > 0:
			sprite_2d.flip_h = true
		elif direction < 0:
			sprite_2d.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		sprite_2d.play("idle")
	
	if global_position.y > 640:
		reset_player()
	move_and_slide()

func reset_player() -> void:
	global_position = start_position
