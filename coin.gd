extends AnimatedSprite2D

@onready var area_2d: Area2D = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_2d.body_entered.connect(enter_coin)

func enter_coin(body : Node2D) -> void:
	if body.name == "Player":
		call_deferred("collect_coin")

func collect_coin() -> void:
	GameManager.add_money()
	queue_free()
	
