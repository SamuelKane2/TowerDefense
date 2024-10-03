extends Node

var gold = 3000
var health = 20

@onready var beginning_timer: Timer = $BeginningTimer
@onready var enemy_timer: Timer = $PathSpawner/EnemyTimer
@onready var _1_st_wave_timer: Timer = $"1stWaveTimer"
@onready var normal_wave_timer: Timer = $NormalWaveTimer

var waveSize = 300
var waveNumber = 1
@onready var wave: Label = $CanvasLayer/Wave

@onready var warning_label: Label = $CanvasLayer/WarningLabel
@onready var warning_panel: Panel = $CanvasLayer/WarningPanel
@onready var warning_timer: Timer = $WarningTimer

func _on_normal_wave_timer_timeout() -> void:
	enemy_timer.start(1)
	_1_st_wave_timer.start(waveSize)
	wave.text = "Wave: " + str(waveNumber)
	print("Wave Number: " + str(waveNumber))
	
func _on_beginning_timer_timeout() -> void:
	enemy_timer.start(1)
	_1_st_wave_timer.start(waveSize)

func _on_st_wave_timer_timeout() -> void:
	enemy_timer.stop()
	normal_wave_timer.start(10)
	waveSize += 2
	waveNumber += 1

func _on_warning_timer_timeout() -> void:
	warning_label.visible = false
	warning_panel.visible = false
