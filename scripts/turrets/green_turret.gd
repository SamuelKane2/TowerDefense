extends BulletTower

var Bullet = preload("res://scenes/Turrets/InvisibleBullet.tscn")
var bulletDamage = 5
var pathName
var currTargets = []
var curr

var reload = 0
var range = 400
@onready var timer = get_node("ProgressBar/Timer")
var startShooting = false

@onready var upgrade_panel: Panel = $UpgradedLevel/UpgradedLevel/UpgradePanel

func _process(_delta):
	# This are positions unrelated to the other code
	upgrade_panel.global_position = self.position + Vector2(592,366)
	get_node("Upgrade/Upgrade").global_position = self.position + Vector2(576,325)
	
	if is_instance_valid(curr):
		self.look_at(curr.global_position)
		if timer.is_stopped():
			timer.start()
	else:
		for i in get_node("BulletContainer").get_child_count():
			get_node("BulletContainer").get_child(i).queue_free()

@onready var fire: Sprite2D = $Fire
@onready var fire_timer: Timer = $FireTimer

func Shoot():
		var tempBullet = Bullet.instantiate()
		tempBullet.pathName = pathName
		tempBullet.bulletDamage = bulletDamage
		get_node("BulletContainer").add_child(tempBullet)
		tempBullet.global_position = $Aim.global_position
		fire.visible = !fire.visible
		fire_timer.start(0.2)

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

# To limit upgrading to 4 times
var timesDone = 0

# Indicating upgrade level
@onready var upgrade_label: Label = $UpgradedLevel/UpgradedLevel/UpgradePanel/UpgradeLabel

func _on_upgrade_pressed() -> void:

	timesDone += 1
	if timesDone == 1:
		upgrade_label.text = "II"
		upgrade_label.global_position = self.position + Vector2(597,363)
		Game.gold -= 250
		
	if timesDone == 2:
		upgrade_label.text = "III"
		upgrade_label.global_position = self.position + Vector2(595,363)
		Game.gold -= 250
		
	if timesDone == 3:
		upgrade_label.text = "IV"
		Game.gold -= 250
		
	if timesDone == 4:
		upgrade_label.text = "V"
		upgrade_label.global_position = self.position + Vector2(597,363)
		Game.gold -= 250
		
	if timesDone <= 4:
		#reload speed
		reload += 0.5
		timer.wait_time = 3 - reload
		# power
		bulletDamage += 3
		
	else:
		pass
	#print("timesDone: " + str(timesDone))
	#print("reload: " + str(reload))
	#print("damage: " + str(bulletDamage))
	#print("------------------------------------------------")

func _on_fire_timer_timeout() -> void:
	fire.visible = !fire.visible
