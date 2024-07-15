extends ColorRect

var leftStep: float
var rightStep: float
var distanceLeftStep: float
var distanceRightStep: float
# Controls the inner circle of the freeze shader
var targetLeftStep: float = 0.25
# Controls the outer circle of the freeze shader
var targetRightStep: float = 0.65
# Time it takes to reach the target steps in seconds
var timeToFreezeInSeconds: float = 0.5
var isFreezing: bool = false

func _ready() -> void:
	leftStep = get_leftStep()
	rightStep = get_rightStep()
	distanceLeftStep = leftStep - targetLeftStep
	distanceRightStep = rightStep - targetRightStep

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select") and not isFreezing:
		isFreezing = true
	
	freeze(delta)

func freeze(delta: float) -> void:
	if isFreezing:
		leftStep -= (distanceLeftStep/timeToFreezeInSeconds * delta)
		rightStep -= (distanceRightStep/timeToFreezeInSeconds * delta)
		get_material().set_shader_parameter("left_step", leftStep)
		get_material().set_shader_parameter("right_step", rightStep)
	
		if get_leftStep() <= targetLeftStep and get_rightStep() <= targetRightStep:
			isFreezing = false

func get_leftStep() -> float:
	return get_material().get_shader_parameter("left_step")

func get_rightStep() -> float:
	return get_material().get_shader_parameter("right_step")
