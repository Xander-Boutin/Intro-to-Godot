extends Sprite2D

var start_pos : Vector2
var target_pos : Vector2
var time : float = 0.0

@onready var start_y : float = global_position.y
@onready var start_x : float = global_position.x
@onready var area_2d: Area2D = $Area2D

@export var move_speed : float = 30.0
@export var move_dir : Vector2
@export var v_bob_speed : float = 0.0
@export var v_bob_height : float = 0.0
@export var h_bob_speed : float = 0.0
@export var h_bob_height : float = 0.0

func _ready():
	area_2d.body_entered.connect(body_entered)
	start_pos = global_position
	target_pos = start_pos + move_dir

func _physics_process(delta: float) -> void:
	time += delta
	var vertical = sin(time * v_bob_speed) / 2
	global_position.y = start_y + (vertical * -v_bob_height)
	
	var horizontal = sin(time * h_bob_speed) / 2
	global_position.x = start_x + (horizontal * -h_bob_height)

func body_entered(body : Node2D) -> void:
	if body.name == "Player":
		body.reset_player()
