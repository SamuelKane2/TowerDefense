extends StaticBody2D

var Bullet = preload("res://scenes/BigRocket.tscn")
var bulletDamange = 5
var pathName
var currTargets = []
var curr

func _on_tower_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "GreenMan":
		var tempArray = []
		currTargets = get_node("Tower").get_overlapping_bodies()

		print(currTargets)

func _on_tower_body_exited(body):
	pass