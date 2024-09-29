extends CharacterBody2D

class_name Bullet

var target
var Speed = 600
var pathName = ""
var bulletDamage

func _physics_process(delta):
	var pathSpawnerNode = get_tree().get_root().get_node("Game/PathSpawner")
	for i in pathSpawnerNode.get_child_count():
		if pathSpawnerNode.get_child(i).name == pathName:
			target = pathSpawnerNode.get_child(i).get_child(0).get_child(0).global_position

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "ManGreen":
		body.Health -= bulletDamage
		queue_free()
