extends StaticBody2D

class_name BulletTower

var bulletDamange = 5
var pathName
var currTargets = []
var curr
var bullet: PackedScene

func _init(newbullet):
	bullet = newbullet

func _process(_delta):
	if is_instance_valid(curr):
		self.look_at(curr.global_position)
	else:
		for i in get_node("BulletContainer").get_child_count():
			get_node("BulletContainer").get_child(i).queue_free()

func _on_tower_body_entered(body: Node2D) -> void:
	if body.name == "ManGreen":
		var tempArray = []
		currTargets = get_node("Tower").get_overlapping_bodies()
		
		for i in currTargets:
			if "ManGreen" in i.name:
				tempArray.append(i)
		var currTarget = null
		
		for i in tempArray:
			if currTarget == null:
				currTarget = i.get_node("../")
			else:
				if i.get_parent().get_progress() > currTarget.get_progress():
					currTarget = i.get_node("../")
		
		curr = currTarget
		pathName = currTarget.get_parent().name
		
		var tempBullet = bullet.instantiate()
		tempBullet.pathName = pathName
		tempBullet.bulletDamage = bulletDamange
		get_node("BulletContainer").add_child(tempBullet)
		tempBullet.global_position = $Aim.global_position
		
func _on_tower_body_exited(_body):
	currTargets = get_node("Tower").get_overlapping_bodies()
