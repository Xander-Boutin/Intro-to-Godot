extends Sprite2D

@onready var door_area: Area2D = $DoorArea

# @export adds a variable to be assigned in the nodes inspector, in this case when
# having the door sprite being selected in the scene tree
@export var next_level : String # @export variables must be typed

# a signal to detect if something has entered the door area
func enter_area(body : Node2D) -> void:
	# check if the body is of the group "Player"
	if body.is_in_group("Player"):
		body.current_door = self # current_ door is a variable in the player, this door is set in that variable
	pass

# a signal to detect if something has exited the door area
func exit_area(body : Node2D) -> void:
	# when the player leaves we make the current door empty
	if body.is_in_group("Player"):
		body.current_door = null
	pass

# this function get the entire active scene and changes it to the next level
# we assigned in the next_level variable
func change_scene() -> void:
	get_tree().change_scene_to_file(next_level)
