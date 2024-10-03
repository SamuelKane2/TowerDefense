extends Node2D

@onready var path = preload("res://scenes/Stage1.tscn")

func _on_timer_timeout():
	var tempPath = path.instantiate()
	add_child(tempPath)
	
@onready var enemy_timer: Timer = $EnemyTimer

func _on_wave_time_timeout() -> void:
	enemy_timer.stop()
