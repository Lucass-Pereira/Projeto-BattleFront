extends KinematicBody2D

export (int) var MIN_SPEED
export (int) var MAX_SPEED
var mob_types = ["Enemy1", "Enemy2", "Enemy3", "Enemy4"]

func _ready():
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]

func _on_Visibility_screen_exited():
	queue_free()
