extends Node2D

var strForm = "%s%d"
var curNode

func fireMissile(dest: Vector2) -> void:
	for i in range(10):
		curNode = get_node(strForm % ["Pad" , i])
		if curNode.fireMissile(dest):
			return
	pass

func reset():
	for i in range(10):
		get_node(strForm % ["Pad" , i]).reset()
	pass
