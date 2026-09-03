extends Control

var money = 0
@onready var label: Label = $CanvasLayer/Label

func _ready() -> void:
	label.text = str("Money: ", money)

func add_money() -> void:
	money += 1
	label.text = str("Money: ", money)
