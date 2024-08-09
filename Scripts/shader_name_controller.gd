extends Sprite2D

func _ready() -> void:
	var child_nodes: Array[Node] = find_children("", "Area2D", false)
	for child in child_nodes:
		if child is Area2D:
			child.name = name
