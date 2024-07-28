extends CharacterBody2D

@export var speed: float = 300
@export var isWhiteTeam: bool = true
@export var input_velocity: Vector2

func _ready() -> void:
	input_velocity = Vector2.from_angle(randf_range(0, 2.0 * PI))

func _physics_process(delta: float) -> void:
	#input_velocity = Vector2.ZERO
	#if isWhiteTeam:
		#input_velocity += \
			#(int(Input.is_key_pressed(KEY_W)) * Vector2.UP) + \
			#(int(Input.is_key_pressed(KEY_A)) * Vector2.LEFT) + \
			#(int(Input.is_key_pressed(KEY_S)) * Vector2.DOWN) + \
			#(int(Input.is_key_pressed(KEY_D)) * Vector2.RIGHT)
	#else:
		#input_velocity += \
			#(int(Input.is_key_pressed(KEY_UP)) * Vector2.UP) + \
			#(int(Input.is_key_pressed(KEY_LEFT)) * Vector2.LEFT) + \
			#(int(Input.is_key_pressed(KEY_DOWN)) * Vector2.DOWN) + \
			#(int(Input.is_key_pressed(KEY_RIGHT)) * Vector2.RIGHT)
	var bod: KinematicCollision2D = move_and_collide(input_velocity * delta * speed)
