shader_type canvas_item;

#include "res://Shaders/2D/plot.gdshaderinc"

uniform float blur_sample : hint_range(1.0, 15.0) = 10.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 total = vec4(0.0);
	vec4 tex = texture(TEXTURE, UV);
	float step_amt = 2.0/blur_sample;
	
	for (float x = -1.0; x <= 1.0; x +=step_amt) {
		total += texture(TEXTURE, UV + vec2(x*0.1,0.0));
	}
	
	COLOR = total / blur_sample;
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}