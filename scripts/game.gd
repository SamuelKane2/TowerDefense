extends Node

var gold = 10000
var health = 20

@onready var death_screen: Control = $DeathScreen
@onready var ui: Control = $UI

func _process(delta):
	if health <= 0:
		death_screen.visible = true
