extends Node2D

export var SPEED = 6

var dest = Vector2()
var dir = Vector2()
var running = false
var nextPoint = Vector2()
var startPos

var explosion = preload("res://Scn/Explosion.tscn")

func setDest(newVec):
	dest = .to_local(newVec)
	running = true
	dir = (dest - position).normalized()
	$Sprite.set_rotation(dir.angle() + PI/2)
	pass

func _process(delta):
	if running:
		nextPoint = position + (dir * SPEED)
		if (nextPoint - position).dot(nextPoint - dest) > 0:
			explode()
		else:
			position = nextPoint
	pass

func explode():
	running = false
	position = dest
	visible = false
	var ex = explosion.instance()
	ex.position = position
	owner.call_deferred("add_child",ex)
	pass

func reset():
	running = false
	position = startPos
	$Sprite.set_rotation(0)
	visible = true
	pass

func _ready():
	startPos = position
	pass
