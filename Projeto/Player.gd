extends KinematicBody2D

var movespeed = 300
var bulletspeed = 1500
var bullet = preload("res://Bullet.tscn")
signal hit

func _ready():
	pass
	
func _physics_process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * movespeed)
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
func shoot():
	var bullet_instance = bullet.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(),Vector2(bulletspeed,0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	

func _on_Player_body_entered(body):
	if "Enemy" in body.name:
		emit_signal("hit")
