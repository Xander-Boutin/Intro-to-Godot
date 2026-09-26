extends AnimatedSprite2D

var start_pos : Vector2
var time : float = 0.0

@onready var area_2d: Area2D = $Area2D

@export var move_speed : float = 30.0
@export var v_bob_speed : float = 0.0
@export var v_bob_height : float = 0.0
@export var h_bob_speed : float = 0.0
@export var h_bob_height : float = 0.0

func _ready():
	start_pos = global_position

func _physics_process(delta: float) -> void:
	# use delta as our time variable so we can get a consistent speed
	time += delta
	# these functions put the movment into a sin wave and move based on speed and hight set
	var vertical = sin(time * v_bob_speed) / 2
	global_position.y = start_pos.y + (vertical * -v_bob_height)
	
	var horizontal = sin(time * h_bob_speed) / 2
	global_position.x = start_pos.x + (horizontal * -h_bob_height)

# if the player enters the enemies are, we call the reset function in player
func body_entered(body : Node2D) -> void:
	if body.name == "Player":
		body.reset_player()
