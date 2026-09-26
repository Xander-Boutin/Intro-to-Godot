# Since we made this a global variable/scene, we can call this script from anywhere by typing GameManager.
# This can be very useful for saving and pulling information that you will need at any time
extends Control

var money = 0
@onready var label: Label = $CanvasLayer/Label
# getting all of the sound players
@onready var coin_sound: AudioStreamPlayer = $Coin
@onready var spring: AudioStreamPlayer = $Spring
@onready var damage: AudioStreamPlayer = $Damage
@onready var button: AudioStreamPlayer = $Button
@onready var door: AudioStreamPlayer = $Door

# set the label to be "Money: 0" at start of game
func _ready() -> void:
	update_label()

# add money and update the label
func add_money() -> void:
	money += 1
	update_label()

# update the label
func update_label() -> void:
	label.text = str("Money: ", money)
