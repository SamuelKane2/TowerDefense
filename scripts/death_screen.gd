extends Control

@onready var death_screen: Control = $"."

func _on_button_pressed() -> void:
	death_screen.visible = false
	#get_tree().paused = false

func _process(delta):
	if Game.health <= 0:
		death_screen.visible = true
		#get_tree().paused = true
