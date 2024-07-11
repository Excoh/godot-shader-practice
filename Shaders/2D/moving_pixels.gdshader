shader_type canvas_item;

mat2 rotate2d(float angle) {
	return mat2(vec2(cos(angle), -sin(angle)),
				vec2(sin(angle), cos(angle)));
}

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec2 st = UV;
	st -= vec2(0.5);
	st = rotate2d(sin(TIME)*PI) * st;
	st += vec2(0.5);
	//COLOR = vec4(col, 1.0);
	COLOR = vec4(st.rg, 0., 1.);
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}