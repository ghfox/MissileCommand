extends Node2D

var time = 0
var scalex = 0.0
export var BTIME = 1
export var RUNTIME = 3

func _ready():
	set_scale(Vector2(scalex,scalex))
	pass

func _process(delta):
	time += delta
	if time <= BTIME:
		scalex = time/BTIME
	else:
		scalex = (RUNTIME - time) / (RUNTIME - BTIME)
		if time >= RUNTIME:
			queue_free()
	set_scale(Vector2(scalex,scalex))
	pass

func hitExplosion():
	pass

func _on_Area2D_area_entered(area):
	if(area.owner.is_in_group("Enemies")):
		area.owner.hitExplosion()
	pass
