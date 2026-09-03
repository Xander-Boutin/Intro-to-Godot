extends AnimatedSprite2D

@onready var area_2d: Area2D = $Area2D
@export var removable_wall : Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_2d.body_entered.connect(area_entered)
	area_2d.body_exited.connect(area_exited)
	pass # Replace with function body.

func area_entered(body : Node2D) -> void:
	if body.name == "Player":
		body.current_button = self

func area_exited(body : Node2D) -> void:
	if body.name == "Player":
		body.current_button = null

func remove_wall() -> void:
	removable_wall.queue_free()
