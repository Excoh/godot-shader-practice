extends StaticBody2D

func _ready() -> void:
	$Area2D.area_entered.connect(on_area_entered)
	
func on_area_entered(area: CharacterBody2D) -> void:
	print (area.name)
