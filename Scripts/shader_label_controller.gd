extends Control

@export var label_offset: Vector2 = Vector2(15,0)

var mouse_position: Vector2

func _ready() -> void:
	$ShaderLabel.minimum_size_changed.connect(update_size)
	$ShaderLabel.visible = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouse_position = event.position
		$ShaderLabel.set_position(event.position + label_offset)

func _physics_process(delta: float) -> void:
	var space_rid: RID = get_world_2d().space
	var space_state: PhysicsDirectSpaceState2D = PhysicsServer2D.space_get_direct_state(space_rid)
	var physicsQueryParams: PhysicsPointQueryParameters2D = PhysicsPointQueryParameters2D.new()
	physicsQueryParams.collide_with_areas = true
	physicsQueryParams.position = mouse_position
	var collision_info: Array[Dictionary] = space_state.intersect_point(physicsQueryParams)
	if collision_info:
		$ShaderLabel.text = collision_info[0].collider.name
		$ShaderLabel.visible = true
	else:
		$ShaderLabel.visible = false
		$ShaderLabel.text = ""

# This makes sure that when the content of the text changes
# the label background also changes to match the width
# of the new text.
func update_size() -> void:
	$ShaderLabel.set_size($ShaderLabel.get_minimum_size())
