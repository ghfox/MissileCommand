extends Node2D

var hasMissile

func _ready():
	hasMissile = true
	pass

func fireMissile(dest: Vector2) -> bool:
	if hasMissile:
		$Missile.setDest(dest)
		hasMissile = false
		return true
	else:
		return false

func reset():
	hasMissile = true
	$Missile.reset()
	pass
