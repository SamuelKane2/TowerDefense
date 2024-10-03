extends Node

var gold = 10000
var health = 20

@onready var wave_time: Timer = $WaveTime
@onready var beginning_timer: Timer = $BeginningTimer
@onready var enemy_timer: Timer = $PathSpawner/EnemyTimer

func _on_beginning_timer_timeout() -> void:
	enemy_timer.start(1)
	wave_time.start(10)
