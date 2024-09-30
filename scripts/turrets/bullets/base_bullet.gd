extends CharacterBody2D

class_name rocket

var target
var Speed = 600
var pathName = ""
var bulletDamage

func _physics_process(_delta):
	var pathSpawnerNode = get_tree().get_root().get_node("Game/PathSpawner")
	for i in pathSpawnerNode.get_child_count():
		if pathSpawnerNode.get_child(i).name == pathName:
			target = pathSpawnerNode.get_child(i).get_child(0).get_child(0).global_position

	velocity = global_position.direction_to(target) * Speed
	look_at(target)
	move_and_slide()
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "ManGreen":
		body.Health -= bulletDamage
		queue_free()