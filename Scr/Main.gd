extends Node2D

var nodeStr = "%s%d"
var enemyMissilesRemaining = 0
export var startAmount = 20

var enemyMissile = preload("res://Scn/EnemyMissile.tscn")

func _ready():
	enemyMissilesRemaining = startAmount
	pass
	
func _input(event):
	var dest = $Cross.position
	if event.is_action_pressed("fire_left"):
		$Battery0.fireMissile(dest)
	if event.is_action_pressed("fire_center"):
		$Battery1.fireMissile(dest)
	if event.is_action_pressed("fire_right"):
		$Battery2.fireMissile(dest)
	
	if event.is_action_pressed("reset"):
		get_tree().call_group("Enemies","queue_free")
		resetBatteries()
		resetCities()
		enemyMissilesRemaining = startAmount
		Global.reset()
	pass

func _process(delta):
	if(!fireMissile() and get_tree().get_nodes_in_group("Enemies").size() == 0):
		if(get_tree().get_nodes_in_group("Cities").size() > 0):
			resetBatteries()
			Global.setLevel(1)
			enemyMissilesRemaining = 20 + Global.level()
	pass

func fireMissile():
	if(enemyMissilesRemaining > 0):
		if(randi()%1000 < 5 + Global.level()):
			var newMissile = enemyMissile.instance()
			newMissile.position = Vector2(randi()%1024,0)
			add_child_below_node($BG,newMissile)
			enemyMissilesRemaining -= 1
		return true
	return false

func resetBatteries():
	get_tree().call_group("Explosions","queue_free")
	for i in range(3):
		get_node(nodeStr % ["Battery",i]).reset()

func resetCities():
	for i in range(6):
		get_node(nodeStr % ["City" , i]).reset()
