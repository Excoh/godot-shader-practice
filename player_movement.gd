extends CharacterBody2D

@export var speed: float = 300

func _physics_process(delta: float) -> void:
	var input_velocity: Vector2 = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		input_velocity += Vector2.RIGHT * delta * speed
	if Input.is_action_pressed("ui_left"):
		input_velocity -= Vector2.RIGHT * delta * speed
	if Input.is_action_pressed("ui_down"):
		input_velocity -= Vector2.UP * delta * speed
	if Input.is_action_pressed("ui_up"):
		input_velocity += Vector2.UP * delta * speed
	var kbod: KinematicCollision2D = move_and_collide(input_velocity)
	if kbod:
		print ("colliding " + str(kbod))

func on_area_entered(area: Area2D) -> void:
	pass
