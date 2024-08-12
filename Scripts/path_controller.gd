extends Path2D

@onready var progress_interval: float = 1.0 / (curve.point_count-1)
@export var follow_speed: float = 0.15

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_right"):
		var tween: Tween = create_tween()
		tween.tween_property($PathFollow2D, "progress_ratio", $PathFollow2D.progress_ratio+progress_interval, follow_speed)
	elif Input.is_action_just_pressed("ui_left"):
		var tween: Tween = create_tween()
		tween.tween_property($PathFollow2D, "progress_ratio", $PathFollow2D.progress_ratio-progress_interval, follow_speed)
