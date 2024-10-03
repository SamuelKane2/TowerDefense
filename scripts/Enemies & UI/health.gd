extends Label

func _on_area_2d_body_entered(body: Node2D) -> void:
	Game.health -= 1
	self.text = str(Game.health)
