extends StaticBody2D

var Bullet = preload("res://scenes/BigRocket.tscn")
var bulletDamange = 5
var pathName
var currTargets = []
var curr

func _on_tower_body_entered(body):
	print("Something entered")
	if "ManGreen" in body.name:
		print("Green entered")
		print(currTargets)
		var tempArray = []
		currTargets = get_node("Tower").get_overlapping_bodies()

func _on_tower_body_exited(body):
	print("Something exited")
