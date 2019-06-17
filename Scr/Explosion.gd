extends Node2D

var time = 0
var scalex = 0.0
export var BTIME = 1
export var RUNTIME = 3

func _ready():
	$Sprite.set_scale(Vector2(scalex,scalex))
	pass

func _process(delta):
	time += delta
	if time <= BTIME:
		scalex = time/BTIME
	else:
		scalex = (RUNTIME - time) / (RUNTIME - BTIME)
		if time >= RUNTIME:
			queue_free()
	$Sprite.set_scale(Vector2(scalex,scalex))
	pass
