extends Node

@export var material: Material

func _process(_delta: float) -> void:
	if material != null:
		material.set_shader_parameter("mouse_input", get_viewport().get_mouse_position())
	$Control/Label.text = str(get_viewport().get_mouse_position())
