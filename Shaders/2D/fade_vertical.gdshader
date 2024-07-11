shader_type canvas_item;

uniform float fade_amount : hint_range(0.,1.) = 0.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 c = texture(TEXTURE, UV);
	float threshold = step(fade_amount, UV.y);
	COLOR = c * threshold;
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}