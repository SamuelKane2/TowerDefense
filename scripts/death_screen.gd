extends Control

@onready var death_screen: Control = $"."
@onready var warning_panel: Panel = $"../WarningPanel"
@onready var warning_label: Label = $"../WarningLabel"

func _on_button_pressed() -> void:
	get_tree().paused = false
	death_screen.visible = false
	warning_label.visible = true
	warning_panel.visible = true
	warning_timer.start(5)
	for i in get_tree().get_child(1):
			if "EnemyTimer" not in i.name:
				queue_free()
				
	
@onready var warning_timer: Timer = $"../../WarningTimer"
@onready var beginning_timer: Timer = $"../../BeginningTimer"

func _process(delta):
	if Game.health <= 0:
		death_screen.visible = true
		get_tree().paused = true
