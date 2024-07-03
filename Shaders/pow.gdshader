shader_type canvas_item;

#include "res://Shaders/plot.gdshaderinc"

uniform float pow_amt : hint_range(0.25, 10.0) = 3.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	// We flip UV y because it is "backwards" in godot, i.e. from top-to-bottom
	// Flipping is abs(UV.y-1.0)
	vec2 st = vec2(UV.x, abs(UV.y-1.0));
	float y = pow(st.x, pow_amt);
	vec3 col = vec3(y);
	float pct = plot(st, y);
	col = (1.0-pct) * col + pct * LINE_COLOR;
	COLOR = vec4(col, 1.0);
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}