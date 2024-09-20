extends StaticBody2D

var Bullet = preload("res://scenes/BigRocket.tscn")
var bulletDamange = 5
var pathName
var currTargets = []
var curr

func _on_tower_body_entered(body:Node2D) -> void:
	if "ManGreen" in body.name:
		var tempArray = []
		currTargets = get_node("Tower").get_overlapping_bodies()

func _on_tower_body_exited(body:Node2D) -> void:
	pass # Replace with function body.
