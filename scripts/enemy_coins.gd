extends CharacterBody2D

class_name enemy
var coins = 0

func _addCoins(amount):
	coins = coins + amount
	print(coins)