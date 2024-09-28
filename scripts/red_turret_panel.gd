extends Panel

@onready var tower = preload("res://scenes/RedTurret.tscn")
var currTile

func _on_gui_input(event:InputEvent) -> void:
	var tempTower = tower.instantiate()
	tempTower.get_node("Area").visible = true
	if event is InputEventMouseButton and event.button_mask == 1 and event.button_index == 1:
		# Left Click Down
		add_child(tempTower)
		tempTower.global_position = event.global_position

		
	elif event is InputEventMouseMotion and event.button_mask == 1:
		# Left click Down Drag
		get_child(3).global_position = event.global_position
		
	elif event is InputEventMouseButton and event.button_mask == 0 and event.button_index == 1:
		# Left Click Up
		if event.global_position.x >= 1000:
			get_child(3).queue_free()
		else:
			var path = get_tree().get_root().get_node("Game/Towers")
			get_child(3).queue_free()
			path.add_child(tempTower)
			tempTower.global_position = event.global_position
			tempTower.get_node("Area").visible = false
