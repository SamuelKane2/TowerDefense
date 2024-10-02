extends Label

func _process(_delta: float) -> void:
	self.text = str(Game.health)


func _on_area_2d_body_entered(body: Node2D) -> void:
	Game.health -= 1
	self.text = str(Game.health)
