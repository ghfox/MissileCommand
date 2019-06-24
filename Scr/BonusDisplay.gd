extends Node2D

var missiles
var cities

var missileScore
var cityScore

var city = preload("res://Art/city_1.png")
var missile = preload("res://Art/missile.png")

func _ready():
	set_visible(false)

func runBonus():
	setTotals()
	setTexts()
	addSprites()
	if(missiles + cities > 0):
		$Timer.start(1.0)
	set_visible(true)
	pass

func setTexts():
	$Text/Cities.set_text("+%d" % cityScore)
	$Text/Missiles.set_text("+%d" % missileScore)
	$Text/Score.set_text("%d" % (missileScore + cityScore))

func setTotals():
	missileScore = 0
	cityScore = 0
	missiles = 0
	for i in get_tree().get_nodes_in_group("Batteries"):
		for j in range(0,10):
			if(i.get_node("Pad%d" % j).hasMissile):
				missiles += 1
	cities = get_tree().get_nodes_in_group("Cities").size()
	pass

func addSprites():
	for i in $Sprites.get_children():
		i.queue_free()
	for i in missiles:
		generateCenteredSprite(0.0, 0.0, i, missiles, missile, 20.0)
	for i in cities:
		generateCenteredSprite(20.0, 45.0, i, cities, city, 12.0)
	pass

func generateCenteredSprite(xoff: float, yoff: float, num: int, total: int, spr: Texture, trim: float):
	var newSpr = Sprite.new()
	newSpr.set_texture(spr)
	newSpr.set_visible(false)
	newSpr.set_position(Vector2(-(total*(newSpr.get_rect().size.x - trim)) + (num * (newSpr.get_rect().size.x - trim)) + 512 + xoff, 384 + yoff))
	$Sprites.add_child(newSpr)
	pass


func tick():
	if(missiles + cities == 0):
		Global.nextLevel()
		set_visible(false)
		return
	var spr = $Sprites.get_child($Sprites.get_child_count()-missiles-cities)
	spr.set_visible(true)
	$Bleep.play(0.0)
	if(missiles > 0):
		missiles -= 1
		missileScore += 10
	else:
		cities -= 1
		cityScore += 100
	setTexts()
	if(missiles + cities > 0):
		$Timer.start(0.5)
	else:
		Global.setScore(missileScore + cityScore)
		$Timer.start(1.5)
	pass


func _on_Bleep_finished():
	$Bleep.stop()
	pass
