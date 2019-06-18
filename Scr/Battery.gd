extends Node2D

var strForm = "%s%d"
var curNode
var active

func _ready():
	active = true
	add_to_group("Batteries")
	pass

func fireMissile(dest: Vector2) -> void:
	for i in range(10):
		curNode = get_node(strForm % ["Pad" , i])
		if curNode.fireMissile(dest):
			if(i == 9):
				remove_from_group("Batteries")
				active = false
			return
	pass

func disableBattery():
	active = false
	for i in range(10):
		curNode = get_node(strForm % ["Pad" , i])
		if(curNode.hasMissile):
			curNode.get_node("Missile").explode()
		curNode.hasMissile = false

func reset():
	add_to_group("Batteries")
	for i in range(10):
		get_node(strForm % ["Pad" , i]).reset()
	active = true
	pass


func _on_Area2D_area_entered(area):
	if(area.owner.is_in_group("Enemies")):
		area.owner.queue_free()
		if(active):
			disableBattery()
			remove_from_group("Batteries")
	pass
