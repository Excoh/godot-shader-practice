extends StaticBody2D
const BLACK: int = 2
const WHITE: int = 3

func _ready() -> void:
	$Area2D.area_entered.connect(on_area_entered)
	
func on_area_entered(area: Area2D) -> void:
	if (area.get_collision_mask_value(BLACK) and get_collision_layer_value(BLACK)) or \
	   (area.get_collision_mask_value(WHITE) and get_collision_layer_value(WHITE)):
		toggle_block_type()

func toggle_block_type() -> void:
	if get_collision_layer_value(BLACK):
		set_collision_layer_value(BLACK, false)
		set_collision_layer_value(WHITE, true)
		$Area2D.set_collision_layer_value(BLACK, false)
		$Area2D.set_collision_layer_value(WHITE, true)
		modulate = Color.WHITE
	elif get_collision_layer_value(WHITE):
		set_collision_layer_value(BLACK, true)
		set_collision_layer_value(WHITE, false)
		$Area2D.set_collision_layer_value(BLACK, true)
		$Area2D.set_collision_layer_value(WHITE, false)
		modulate = Color.BLACK
