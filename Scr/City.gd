extends Node2D

func _ready():
	add_to_group("Cities")
	pass

func _on_Area2D_area_entered(area):
	var node = area.owner
	if(node.is_in_group("Enemies")):
		node.queue_free()
		if(is_in_group("Cities")):
			visible = false
			remove_from_group("Cities")
	pass # Replace with function body.
