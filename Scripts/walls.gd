extends Area2D
@export var reflect_x: bool

func _ready() -> void:
	area_entered.connect(on_area_entered)

func on_area_entered(area: Area2D) -> void:
	if area.name.contains("Player"):
		var dir: Vector2 = area.get_parent().input_velocity
		if reflect_x:
			area.get_parent().input_velocity = Vector2(-dir.x, dir.y)
		else:
			area.get_parent().input_velocity = Vector2(dir.x, -dir.y)
