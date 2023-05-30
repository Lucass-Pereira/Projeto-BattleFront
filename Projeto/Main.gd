extends Node

signal start_game
var position = 0

func _ready():

	$play_area.hide()
	$Player/Area2D/CollisionShape2D.disabled = true
		
func _on_StartButton_up():
	$StartButton.hide()
	$Player/Area2D/CollisionShape2D.disabled = false
	$menu.hide()
	$lblNome.hide()
	$play_area.show()
	$Timer.start()
	$Music.play()
	emit_signal("start_game")
	
	
func game_over():
	get_tree().reload_current_scene()
	

func _on_Enemy_shot():
	_spawn_1()
	
func _on_Enemy2_shot2():
	_spawn_2()

func _on_Enemy3_shot3():
	 _spawn_3()
	
func _on_Enemy4_shot4():
	_spawn_4()
	
	
func _spawn_1():
	randomize()
	$MobPath/MobSpawnLocation.set_offset(randi())
	var enemy = $Enemy
	add_child(enemy)
	var direction = $MobPath/MobSpawnLocation.rotation + PI/2
	enemy.position = $MobPath/MobSpawnLocation.position
	
func _spawn_2():
	randomize()
	$MobPath/MobSpawnLocation.set_offset(randi())
	var enemy = $Enemy2
	add_child(enemy)
	var direction = $MobPath/MobSpawnLocation.rotation + PI/2
	enemy.position = $MobPath/MobSpawnLocation.position
	
func _spawn_3():
	randomize()
	$MobPath/MobSpawnLocation.set_offset(randi())
	var enemy = $Enemy3
	add_child(enemy)
	var direction = $MobPath/MobSpawnLocation.rotation + PI/2
	enemy.position = $MobPath/MobSpawnLocation.position
	
func _spawn_4():
	randomize()
	$MobPath/MobSpawnLocation.set_offset(randi())
	var enemy = $Enemy4
	add_child(enemy)
	var direction = $MobPath/MobSpawnLocation.rotation + PI/2
	enemy.position = $MobPath/MobSpawnLocation.position
	
	

