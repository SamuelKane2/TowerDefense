extends Control

@onready var death_screen: Control = $"."
@onready var warning_panel: Panel = $"../WarningPanel"
@onready var warning_label: Label = $"../WarningLabel"

@onready var death_timer: Timer = $DeathTimer
@onready var warning_timer: Timer = $"../../WarningTimer"
@onready var beginning_timer: Timer = $"../../BeginningTimer"
@onready var enemy_timer: Timer = $"../../PathSpawner/EnemyTimer"
@onready var _1_st_wave_timer: Timer = $"../../1stWaveTimer"
@onready var normal_wave_timer: Timer = $"../../NormalWaveTimer"

func _on_button_pressed() -> void:
	enemy_timer.stop()
	_1_st_wave_timer.stop()
	normal_wave_timer.stop()
	beginning_timer.start(20)
	Game.health = 20
	Game.gold = 300
	death_screen.visible = false
	warning_label.visible = true
	warning_panel.visible = true
	warning_timer.start(5)
	
	for i in get_parent().get_parent().get_child(1).get_children():
			if "EnemyTimer" not in i.name:
				i.queue_free()
				
	for i in get_parent().get_parent().get_child(2).get_children():
			if "EnemyTimer" not in i.name:
				i.queue_free()
				
	for i in get_parent().get_parent().get_child(6).get_children():
			if "EnemyTimer" not in i.name:
				i.visible = true

func _process(delta):
	if Game.health <= 0:
		death_screen.visible = true
		Game.health = 0

#func _on_death_timer_timeout() -> void:
#	print("Death Timer timeout")
#	death_screen.visible = false
#	warning_label.visible = true
#	warning_panel.visible = true
#	warning_timer.start(5)
#	for i in get_tree().get_child(1).get_children():
#			if "EnemyTimer" not in i.name:
#				i.queue_free()
				
				
				
				
