extends StaticBody2D

var Bullet = preload("res://scenes/Turrets/BigBullet.tscn")
var bulletDamage = 10
var pathName
var currTargets = []
var curr

var reload = 0
var range = 400
@onready var timer = get_node("ProgressBar/Timer")
var startShooting = false

func _process(_delta):
	# This is the position of the upgrade button, it is unrelated to the other code
	get_node("Upgrade/Upgrade").global_position = self.position + Vector2(576,325)
	
	if is_instance_valid(curr):
		self.look_at(curr.global_position)
		if timer.is_stopped():
			timer.start()
	else:
		for i in get_node("BulletContainer").get_child_count():
			get_node("BulletContainer").get_child(i).queue_free()

func Shoot():
		var tempBullet = Bullet.instantiate()
		tempBullet.pathName = pathName
		tempBullet.bulletDamage = bulletDamage
		get_node("BulletContainer").add_child(tempBullet)
		tempBullet.global_position = $Aim.global_position	

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
		
func _on_tower_body_exited(_body):
	currTargets = get_node("Tower").get_overlapping_bodies()

func _on_timer_timeout() -> void:
	Shoot()

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_mask == 1 and event.button_index == 1:
		var towerPath = get_tree().get_root().get_node("Game/Towers")
		# Later
		#get_node("Range").visible = !get_node("Range").visible
		for i in towerPath.get_child_count():
			if towerPath.get_child(i).name != self.name:
				towerPath.get_child(i).get_node("Upgrade/Upgrade").hide()
		get_node("Upgrade/Upgrade").visible = !get_node("Upgrade/Upgrade").visible

# To limit upgrading to 4 times
var timesDone = 0

func _on_upgrade_pressed() -> void:
	
	# reloading
	timesDone += 1
	
	if timesDone <= 4:
		reload += 0.3
		timer.wait_time = 4 - reload
		
		# power
		bulletDamage += 8
	print("timesDone: " + str(timesDone))
	print("reload: " + str(reload))
	print("damage: " + str(bulletDamage))
	print("------------------------------------------------")