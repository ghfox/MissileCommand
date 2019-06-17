extends Node2D

var nodeStr = "%s%d"

func _ready():
	pass
	
func _input(event):
	var dest = $Cross.position
	if event.is_action_pressed("fire_left"):
		$Battery0.fireMissile(dest)
	if event.is_action_pressed("fire_center"):
		$Battery1.fireMissile(dest)
	if event.is_action_pressed("fire_right"):
		$Battery2.fireMissile(dest)
	
	if event.is_action_pressed("ui_focus_next"):
		resetBatteries()
	pass
	
func resetBatteries():
	get_tree().call_group("Explosions","queue_free")
	for i in range(3):
		get_node(nodeStr % ["Battery",i]).reset()
