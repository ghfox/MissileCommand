extends Node2D

var hasMissile

var snds = [preload("res://Snd/Bottle Rocket-SoundBible.com-332895117.wav")]

func _ready():
	hasMissile = true
	pass

func fireMissile(dest: Vector2) -> bool:
	if hasMissile:
		$Missile.setDest(dest)
		hasMissile = false
		$AudioStreamPlayer2D.set_stream(snds[randi()%snds.size()])
		$AudioStreamPlayer2D.play(0.0)
		return true
	else:
		return false

func reset():
	hasMissile = true
	$Missile.reset()
	pass
