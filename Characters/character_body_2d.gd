# this tells us what type of node this code can be attached to
# so this code can only be attached to CharacterBody2D or it will cause an error
extends CharacterBody2D

#These are global variables that we set for the CharacterBody2D to use, this being the player.
#global variables can be called anywhere in this script or pulled from others if needed.

#these variables are constant so they can never change
const SPEED = 300.0
const ACCEL = 10.0
const STOP_ACCEL = 15.0
const JUMP_VELOCITY = -400.0

#these variables are dynamic and can change into any type
var current_door
var current_button

#these variables are typed so they can only be of the type they are assigned
var start_position : Vector2 #this can only be a Vector2(x,y)  
var big_jump : bool = false #this can be only true(1) or false(0)

#@onready variables are assigned when the scene is ready, connecting a node in the scene tree
#to the node the script is attached to
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

#hover over _ready() to see what the function does. 
#anything built into godot will show its description when hovered over
#if ctrl + left clicked, will take you to its direct documentation
func _ready() -> void:
	start_position = global_position # set the start position of the player

func _input(event: InputEvent) -> void:
	# here we are checking if the key pressed was jump(spacebar) and they are on the floor
	# if so we run the code indented
	if event.is_action_pressed("jump") and is_on_floor():
		if big_jump == false: #if the variable big_jump is false, the player will jump the normal hight
			velocity.y = JUMP_VELOCITY

		else: #else they jump twice as high
			velocity.y = JUMP_VELOCITY * 2
			big_jump = false
	
	if event.is_action_pressed("interact"):
		# if the current_door or current button is null(empty), we skip this code
		if current_door != null: # != means not equal
			current_door.change_scene() # change_scene() is a function in the door code
		if current_button != null:
			current_button.remove_wall()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# direction is based on if we press move_left
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		# we linearly interpolate the x velocity based on the direction * speed and the acceleration * time(delta)
		velocity.x = lerp(velocity.x, direction * SPEED, ACCEL * delta)
		
		sprite_2d.play("walk") # play the animation walk that was created in the Sprite2D node
		
		# check if we are walking left or right and flip the player horizontaly based on direction
		if direction > 0: # moving right, direction = 1
			sprite_2d.flip_h = true
		elif direction < 0: # moving left, direction = -1
			sprite_2d.flip_h = false
	
	else: # if direction has no input, we lerp the player to 0 and play idle animation
		velocity.x = lerp(velocity.x, 0.0, ACCEL * delta / 2)
		sprite_2d.play("idle")
	
	# if the player falls under the x axis (positive y) we call the function reset_player()
	if global_position.y > 0:
		reset_player()
	
	# hover over move_and_slide() to learn more
	move_and_slide()

# This function updates the players global position to their starting position
func reset_player() -> void:
	GameManager.damage.play()
	global_position = start_position
