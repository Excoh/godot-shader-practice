shader_type canvas_item;

#include "res://Shaders/2D/plot.gdshaderinc"

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	// We flip UV y because it is "backwards" in godot, i.e. from top-to-bottom
	// Flipping is abs(UV.y-1.0)
	vec2 st = vec2(UV.x, abs(UV.y-1.0));
	// The background does look like a line right?
	float y = 1.-cos(st.x*(PI/2.));
	vec3 col = vec3(y);
	float pct = plot(st, y);
	col = (1.0-pct) * col + pct * LINE_COLOR;
	COLOR = vec4(col, 1.0);
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}