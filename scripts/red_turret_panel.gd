extends Panel

#@onready var tower = preload("res://scenes/BigRocket.tscn")
#var currTile

func _on_gui_input(event:InputEvent) -> void:
	print("Anything")
	print(event)
	#var tempTower = tower.instantiate()
	#if event is InputEventMouseButton and event.button_mask == 1:
		#pass