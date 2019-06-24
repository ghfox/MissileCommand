extends Node

var scoreD
var levelD
var playing

func _ready():
	scoreD = 0
	levelD = 0
	playing = true
	pass 

func setScore(val: int):
	scoreD += val
	updateHUD()

func setLevel(val: int):
	levelD += val
	updateHUD()

func level() -> int:
	return levelD

func score() -> int:
	return scoreD

func nextLevel():
	get_node("/root/Main").resetBatteries()
	levelD += 1
	get_node("/root/Main").enemyMissilesRemaining = 20 + levelD
	playing = true
	pass

func reset():
	get_node("/root/Main/snd_over").stop()
	get_node("/root/Main/snd_siren").stop()
	scoreD = 0
	levelD = 0
	updateHUD()
	playing = true

func cityDestroyed():
	if(get_tree().get_nodes_in_group("Cities").size() == 0):
		playing = false
		get_node("/root/Main/snd_siren").stop()
		get_node("/root/Main/snd_over").play(0.0)
	if(get_tree().get_nodes_in_group("Cities").size() == 3):
		get_node("/root/Main/snd_siren").play(0.0)

func updateHUD():
	var hud = "Level:%d\nScore:%d"
	get_node("/root/Main/HUD").text = (hud % [levelD,scoreD])
