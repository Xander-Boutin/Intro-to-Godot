extends Sprite2D

# this function is a signal set up from the Area2D in the scene tree
# when a body enters this area, this function is ran
func spike_entered(body : Node2D) -> void:
	if body.name == "Player":
		body.reset_player()
