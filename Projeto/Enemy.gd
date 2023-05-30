extends KinematicBody2D

var velocity = Vector2()

func _ready():
	pass
	
func _physics_process(delta):
	var Player = get_parent().get_node("Player")
	position += (Player.position - position)/80
	look_at(Player.position)
	move_and_collide(velocity)
	

func _on_Enemy_body_entered(body):
	if "Bullet" in body.name:
		queue_free()
