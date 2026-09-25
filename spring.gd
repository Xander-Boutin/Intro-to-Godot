extends AnimatedSprite2D

@onready var area_2d: Area2D = $Area2D
@export var v_spring_strength : int
@export var h_spring_strength : int

func area_entered(body : Node2D) -> void:
	if body.is_in_group("Player"):
		# change the players velocity based on spring strength
		body.velocity.y += -v_spring_strength
		body.velocity.x += h_spring_strength
		play("boing") # play the animation "boing"
