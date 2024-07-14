shader_type canvas_item;

uniform sampler2D ice_texture;
uniform sampler2D noise;
uniform sampler2D background_texture;
uniform float left_step : hint_range(0, 1.0) = 0.45;
uniform float right_step : hint_range(0, 1.0) = 0.7;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 tex = texture(ice_texture, UV);
	vec4 forest_tex = texture(background_texture, UV);
	vec4 noise_tex = texture(noise, UV);
	float circle = distance(SCREEN_UV, vec2(0.5));
	float col = smoothstep(left_step, right_step, circle);
	vec3 final_col = mix(forest_tex.rgb, tex.rgb, 0.5) * col;
	COLOR = vec4(final_col, col);
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
