shader_type canvas_item;

uniform int fract_count : hint_range(1,10) = 5;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	// Signed distance from the center.
	vec2 st = UV;
	// Calculate the length of a vector from [0,0]
	st = st*2.-1.;
	float pct = length(st);
	COLOR = vec4(vec3(fract(pct*float(fract_count))), 1.0);
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}