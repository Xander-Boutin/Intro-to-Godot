extends AnimatedSprite2D

@onready var area_2d: Area2D = $Area2D
@export var removable_wall : Sprite2D

# These first 2 functions are similar to the door, check the door code for comments
func area_entered(body : Node2D) -> void:
	if body.is_in_group("Player"):
		body.current_button = self

func area_exited(body : Node2D) -> void:
	if body.is_in_group("Player"):
		body.current_button = null

# remove the removable_wall from the scene tree
func remove_wall() -> void:
	GameManager.button.play()
	removable_wall.queue_free()
