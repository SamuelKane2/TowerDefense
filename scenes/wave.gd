extends Label

func _process(delta: float) -> void:
	self.text = "Wave: " + str(Game.waveNumber)
	print(Game.waveNumber)
