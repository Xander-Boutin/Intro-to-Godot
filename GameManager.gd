extends Control

var money = 0
@onready var label: Label = $CanvasLayer/Label

func _ready() -> void:
	update_label()

func add_money() -> void:
	money += 1
	update_label()

func update_label() -> void:
	label.text = str("Money: ", money)
