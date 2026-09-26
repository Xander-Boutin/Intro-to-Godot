extends AnimatedSprite2D


# this function is a signal set up from the Area2D in the scene tree
# when a body enters this area, this function is ran
func enter_coin(body : Node2D) -> void:
	if body.is_in_group("Player"): # check if the body is in the global group "Player"
		GameManager.add_money() # call the GameManager script and run the add_money() function
		GameManager.coin_sound.play() # same as line above but to play the sound in coin_sound
		queue_free() # this function will remove the coin from the game
