extends Sprite2D

@onready var door_area: Area2D = $DoorArea
@export var next_level : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	door_area.body_entered.connect(enter_area)
	door_area.body_exited.connect(exit_area)
	pass # Replace with function body.

func enter_area(body : Node2D) -> void:
	if body.name == "Player":
		body.current_door = self
	pass

func exit_area(body : Node2D) -> void:
	if body.name == "Player":
		body.current_door = null
	pass

func change_scene() -> void:
	get_tree().change_scene_to_file(next_level)
