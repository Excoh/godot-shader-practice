extends Path2D

@onready var progress_interval: float = 1.0 / (curve.point_count-1)
@export var follow_speed: float = 0.15

func _process(delta: float) -> void:
	var progress_ratio: float = 0
	var hasChanged: bool = false
	if Input.is_action_just_pressed("ui_right"):
		progress_ratio = fmod($PathFollow2D.progress_ratio + progress_interval, (1+progress_interval))
		hasChanged = true
	elif Input.is_action_just_pressed("ui_left"):
		if $PathFollow2D.progress_ratio - progress_interval < 0:
			progress_ratio = 1.0
		else:
			progress_ratio = fmod($PathFollow2D.progress_ratio - progress_interval, (1+progress_interval))
		hasChanged = true

	if hasChanged:
		var tween: Tween = create_tween()
		tween.tween_property($PathFollow2D, "progress_ratio", progress_ratio, follow_speed).set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_OUT)
