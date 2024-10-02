extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#print(get_parent())
	#print(get_parent().get_parent())
	#self.global_position = self.global_position + Vector2(-576,-328.5)

func _on_button_pressed() -> void:
	print(get_parent())
	print(get_parent().get_parent())
	print("Restart")