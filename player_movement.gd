extends CharacterBody2D

@export var speed: float = 300
@export var isWhiteTeam: bool = true

func _physics_process(delta: float) -> void:
	var input_velocity: Vector2 = Vector2.ZERO
	if isWhiteTeam:
		input_velocity += \
			(int(Input.is_key_pressed(KEY_W)) * Vector2.UP) + \
			(int(Input.is_key_pressed(KEY_A)) * Vector2.LEFT) + \
			(int(Input.is_key_pressed(KEY_S)) * Vector2.DOWN) + \
			(int(Input.is_key_pressed(KEY_D)) * Vector2.RIGHT)
	else:
		input_velocity += \
			(int(Input.is_key_pressed(KEY_UP)) * Vector2.UP) + \
			(int(Input.is_key_pressed(KEY_LEFT)) * Vector2.LEFT) + \
			(int(Input.is_key_pressed(KEY_DOWN)) * Vector2.DOWN) + \
			(int(Input.is_key_pressed(KEY_RIGHT)) * Vector2.RIGHT)
	var kbod: KinematicCollision2D = move_and_collide(input_velocity * delta * speed)
