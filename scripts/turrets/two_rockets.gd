extends BulletTower

func _on_tower_body_entered(body: Node2D) -> void:
	Bullet = preload("res://scenes/Turrets/SmallBullet.tscn")
