shader_type canvas_item;

uniform float left_step : hint_range(0, 1.0) = 0.2;
uniform float right_step : hint_range(0, 1.0) = 0.8;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	// Signed distance from the center.
	float pct = distance(UV, vec2(0.5));
	vec3 col = 1.0 - vec3(pct);
	col = smoothstep(left_step, right_step, col);
	COLOR = vec4(col, 1.0);
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}