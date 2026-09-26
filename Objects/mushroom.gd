extends Sprite2D

# set a variable in the player called big_jump, that allowes us to jump higher once
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.big_jump = true
		queue_free()
	pass # Replace with function body.
