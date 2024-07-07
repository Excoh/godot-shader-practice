shader_type canvas_item;

// Uniforms come from the CPU and is passed to all parallel
// threads in the GPU. Uniforms are set as read-only.
uniform vec2 mouse_input;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	COLOR = texture(TEXTURE, UV);
	COLOR.r = sin(TIME);
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
