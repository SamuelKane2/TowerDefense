extends Node2D

@onready var path = preload("res://scenes/Stage_1.tscn")

func _on_timer_timeout() -> void:
	var tempPath = path.instatiate()
	add_child(tempPath)