shader_type canvas_item;

uniform float dissolve_amount : hint_range(0.,1.) = 0.5;
uniform sampler2D noise;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 c = texture(noise, UV);
	vec4 main_color = texture(TEXTURE, UV);
	float dissolve_alpha = step(dissolve_amount,(c.r+c.g+c.b)/3.0);
	COLOR = vec4(main_color.rgb, main_color.a * dissolve_alpha);
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
