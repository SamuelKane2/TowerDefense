extends Control

@onready var death_screen: Control = $"."

func _on_button_pressed() -> void:
	death_screen.visible = false
