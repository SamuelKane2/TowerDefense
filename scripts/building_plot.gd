extends StaticBody2D

func _on_panel_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 1 and event.button_index == 1:
		var towerPath = get_tree().get_root().get_node("Game/BuildingPlots")
		for i in towerPath.get_child_count():
			if towerPath.get_child(i).name != self.name:
				towerPath.get_child(i).get_node("Build/Build").hide()
		get_node("Build/Build").visible = !get_node("Build/Build").visible
		get_node("Build/Build").global_position = self.position + Vector2(576,325)

func _on_one_rocket_panel_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 1 and event.button_index == 1:
		print("yes")
