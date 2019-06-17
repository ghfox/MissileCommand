extends Node2D

export var speed = 7

func _process(delta):
	var x = 0
	var y = 0
	if Input.is_action_pressed("move_down"):
		y += 1
	if Input.is_action_pressed("move_up"):
		y -= 1
	if Input.is_action_pressed("move_left"):
		x -= 1
	if Input.is_action_pressed("move_right"):
		x += 1
	var mod = speed *  Vector2(x,y).normalized()
	if Input.is_action_pressed("move_faster"):
		mod = mod * 2
	position += mod
	if position.x > 1024 or position.x < 0:
		position.x -= mod.x
	if position.y > 768 or position.y < 0:
		position.y -= mod.y
	pass
