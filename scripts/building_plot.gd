extends StaticBody2D

func _on_panel_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 1 and event.button_index == 1:
		var towerPath = get_parent().get_parent().get_child(3)
		for i in towerPath.get_child_count():
			if towerPath.get_child(i).name != self.name:
				towerPath.get_child(i).get_node("Build/Build").hide()
		get_node("Build/Build").visible = !get_node("Build/Build").visible
		get_node("Build/Build").global_position = self.position + Vector2(576,325)

# Creating the towers
var OneRocketScene = preload("res://scenes/Turrets/OneRocket.tscn")

func _on_one_rocket_panel_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 1 and event.button_index == 1:
		if Game.gold >= 100:
			Game.gold -= 100
			var tempTower = OneRocketScene.instantiate()
			get_parent().get_parent().get_node("Towers").add_child(tempTower)
			tempTower.position = self.position
			get_node("Build").get_parent().visible = false
			get_node("Build/Build").visible = false
		
		
var TwoRocketsScene = preload("res://scenes/Turrets/TwoRockets.tscn")

func _on_two_tockets_panel_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 1 and event.button_index == 1:
		if Game.gold >= 150:
			Game.gold -= 150
			var tempTower = TwoRocketsScene.instantiate()
			get_parent().get_parent().get_node("Towers").add_child(tempTower)
			tempTower.get_node("Range").visible = false
			tempTower.position = self.position
			get_node("Build").get_parent().visible = false
			get_node("Build/Build").visible = false


var GreenTurretScene = preload("res://scenes/Turrets/GreenTurret.tscn")

func _on_panel_4_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 1 and event.button_index == 1:
		if Game.gold >= 100:
			Game.gold -= 100
			var tempTower = GreenTurretScene.instantiate()
			get_parent().get_parent().get_node("Towers").add_child(tempTower)
			tempTower.get_node("Range").visible = false
			tempTower.position = self.position
			get_node("Build").get_parent().visible = false
			get_node("Build/Build").visible = false


var RedTurretScene = preload("res://scenes/Turrets/RedTurret.tscn")

func _on_red_turret_panel_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 1 and event.button_index == 1:
		if Game.gold >= 150:
			Game.gold -= 150
			var tempTower = RedTurretScene.instantiate()
			get_parent().get_parent().get_node("Towers").add_child(tempTower)
			tempTower.get_node("Range").visible = false
			tempTower.position = self.position
			get_node("Build").get_parent().visible = false
			get_node("Build/Build").visible = false
