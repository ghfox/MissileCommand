extends Node

var scoreD
var levelD

func _ready():
	scoreD = 0
	levelD = 0
	pass 

func score(val: int):
	scoreD += val
	updateHUD()

func level(val: int):
	levelD = val
	updateHUD()

func reset():
	scoreD = 0
	updateHUD()

func updateHUD():
	var hud = "Level:%d\nScore:%d"
	get_node("/root/Main/HUD").text = (hud % [levelD,scoreD])
