extends Node

var scoreD
var levelD

func _ready():
	scoreD = 0
	levelD = 0
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

func reset():
	scoreD = 0
	levelD = 0
	updateHUD()

func updateHUD():
	var hud = "Level:%d\nScore:%d"
	get_node("/root/Main/HUD").text = (hud % [levelD,scoreD])
