extends Node2D

var time = 0
var xscale = Vector2(0,0)
export var BTIME = 3
export var RUNTIME = 6

func _ready():
	get_node("Sprite").set_scale(xscale)
	pass

func _process(delta):
	time += delta
	if time <= BTIME:
		xscale = Vector2(time/BTIME,time/BTIME)
		get_node("Sprite").set_scale(xscale * 2)
	else:
		get_node("Sprite").set_visible(( (time * 15) as int % 2) > 0)
		if time >= RUNTIME:
			queue_free()
	pass
