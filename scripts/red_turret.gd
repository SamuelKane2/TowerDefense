extends StaticBody2D

var Bullet = preload("res://scenes/BigRocket.tscn")
var bulletDamange = 5
var pathName
var currTargets = []
var curr

func _on_tower_body_entered(body: Node2D) -> void:
	if body.name == "GreenMan":
		var tempArray = []
		currTargets = get_node("Tower").get_overlapping_bodies()
		for i in currTargets:
			if "GreenMan" in i.name:
				tempArray.append(i)
		
func _on_tower_body_exited(body):
	pass
