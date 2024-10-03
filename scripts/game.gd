extends Node

var gold = 300
var health = 20

@onready var beginning_timer: Timer = $BeginningTimer
@onready var enemy_timer: Timer = $PathSpawner/EnemyTimer

@onready var _1_st_wave_timer: Timer = $"1stWaveTimer"

var waveSize = 1

func _on_beginning_timer_timeout() -> void:
	enemy_timer.start(1)
	_1_st_wave_timer.start(waveSize)

func _on_st_wave_timer_timeout() -> void:
	enemy_timer.stop()
	beginning_timer.start(10)
	waveSize += 2
