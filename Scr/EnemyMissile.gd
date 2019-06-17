extends Node2D

var target = Vector2(512,768)
var dir = Vector2(0,0)
export var speed = 3

func _ready():
	chooseTarget()
	dir = (target-position).normalized()
	$Sprite.set_rotation(dir.angle() + PI/2 )
	pass

func chooseTarget():
	var targetNode = self
	var numCities = get_tree().get_nodes_in_group("Cities").size()
	var numBats = get_tree().get_nodes_in_group("Batteries").size()
	if(rand_range(0,10) < 5 and numCities > 0):
		targetNode = get_tree().get_nodes_in_group("Cities")[randi()%numCities-1]
	elif (numBats > 0):
		targetNode = get_tree().get_nodes_in_group("Batteries")[randi()%numBats-1]
	if(targetNode != self):
		target = targetNode.to_global(targetNode.position)
	pass

func _process(delta):
	position += dir * speed
	pass

func hitExplosion():
	queue_free()
	pass
