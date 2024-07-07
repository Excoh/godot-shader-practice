shader_type canvas_item;

#include "res://Shaders/2D/plot.gdshaderinc"

uniform float saturation : hint_range(0, 1.0) = 0.5;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	// We flip UV y because it is "backwards" in godot, i.e. from top-to-bottom
	// Flipping is abs(UV.y-1.0)
	vec4 tex = texture(TEXTURE, UV);
	float gray = (tex.r+tex.g+tex.b) / 3.0;
	vec4 grayRGBA = vec4(gray,gray,gray,tex.a);
	COLOR = mix(grayRGBA, tex, saturation);
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}