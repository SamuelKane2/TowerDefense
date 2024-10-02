extends StaticBody2D

class_name BulletTower

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_mask == 1 and event.button_index == 1:
		var towerPath = get_parent().get_parent().get_child(2)
		#get_node("Range").visible = !get_node("Range").visible
		for i in towerPath.get_child_count():
			if towerPath.get_child(i).name != self.name:
				towerPath.get_child(i).get_node("Upgrade/Upgrade").hide()
		get_node("Upgrade/Upgrade").visible = !get_node("Upgrade/Upgrade").visible
