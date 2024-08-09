shader_type canvas_item;

uniform float dissolve_amount : hint_range(0.,1.) = 0.5;
uniform float edge_width = 5.0;
uniform vec3 edge_color : source_color = vec3(1., 0., 0.);
uniform sampler2D noise;

float diss_alpha(float dissolve_amt, vec3 c) {
	return step(dissolve_amount, (c.r+c.g+c.b)/3.0);
}

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 c = texture(noise, UV);
	ivec2 C_SIZE = textureSize(noise, 0);
	vec2 C_PIXEL_SIZE = vec2(1.0 / float(C_SIZE.x), 1.0 / float(C_SIZE.y));
	vec4 c_up = texture(noise, UV + vec2(0., -C_PIXEL_SIZE.y*edge_width));
	vec4 c_right = texture(noise, UV + vec2(C_PIXEL_SIZE.x*edge_width, 0.));
	vec4 c_down = texture(noise, UV + vec2(0., C_PIXEL_SIZE.y*edge_width));
	vec4 c_left = texture(noise, UV + vec2(-C_PIXEL_SIZE.x*edge_width, 0.));
	vec4 main_color = texture(TEXTURE, UV);
	// We are averaging out the color because
	// the alpha of the noise is actually 1.0 across
	// the image
	float dissolve_alpha = step(dissolve_amount,(c.r+c.g+c.b)/3.0);
	float da_up = diss_alpha(dissolve_amount, c_up.rgb);
	float da_right = diss_alpha(dissolve_amount, c_right.rgb);
	float da_down = diss_alpha(dissolve_amount, c_down.rgb);
	float da_left = diss_alpha(dissolve_amount, c_left.rgb);
	if (da_up <= 0. || da_right <= 0. || da_down <= 0. || da_left <= 0.) {
		main_color.rgb = edge_color;
	}
	COLOR = vec4(main_color.rgb, main_color.a * dissolve_alpha);
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
