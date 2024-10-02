extends CharacterBody2D

@export var speed = 500
var Health = 20

func _process(delta: float) -> void:
	get_parent().set_progress(get_parent().get_progress() + speed * delta)
	if get_parent().get_progress_ratio() > 0.999 and get_parent().get_progress_ratio() < 1:
		#Game.health -= 1
		queue_free()
	
	if Health <= 0:
		Game.gold += 20
		get_parent().get_parent().queue_free()
