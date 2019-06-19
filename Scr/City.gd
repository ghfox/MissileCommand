extends Node2D

func _ready():
	add_to_group("Cities")
	pass

func _on_Area2D_area_entered(area):
	var node = area.owner
	if(node.is_in_group("Enemies")):
		node.queue_free()
		if(is_in_group("Cities")):
			$Sprite.visible = false
			$Burning.visible = true
			remove_from_group("Cities")
			Global.cityDestroyed()
	pass

func reset():
	$Sprite.visible = true
	$Burning.visible = false
	add_to_group("Cities")
	visible = true