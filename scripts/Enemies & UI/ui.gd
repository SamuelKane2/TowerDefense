extends Control

@onready var health: Label = $Panel/Health

func _process(_delta: float) -> void:
	health.text = str(Game.health)
