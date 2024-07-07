shader_type canvas_item;

#include "res://Shaders/2D/plot.gdshaderinc"

uniform int tex_id : hint_range(0, 3, 1) = 0;
const vec2 pos[4] = vec2[](vec2(0.0,0.0), vec2(0.5,0.0), vec2(0.0,0.5), vec2(0.5,0.5));

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	// We flip UV y because it is "backwards" in godot, i.e. from top-to-bottom
	// Flipping is abs(UV.y-1.0)
	vec4 tex = texture(TEXTURE, UV / 2.0 + pos[tex_id]);
	COLOR = tex;
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}