extends Node2D

var time = 0
var scalex = 0.0
export var BTIME = 1
export var RUNTIME = 3

var snds = [preload("res://Snd/Grenade Explosion-SoundBible.com-2100581469.wav"),
			preload("res://Snd/Big Bomb-SoundBible.com-1219802495.wav")]

func _ready():
	set_scale(Vector2(scalex,scalex))
	var audio = snds[randi()%snds.size()]
	$AudioStreamPlayer2D.set_stream(audio)
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

func _on_Area2D_area_entered(area):
	if(area.owner.is_in_group("Enemies")):
		area.owner.hitExplosion()
	pass
