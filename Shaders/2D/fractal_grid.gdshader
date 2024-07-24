shader_type canvas_item;

// Subdivide a uv space
// by a number of column and rows.
// Each subspace will range from 0-1
vec2 grid(vec2 uv, int col, int row) {
	return fract(uv * vec2(float(col), float(row)));
}

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec2 st = UV;
	// Scale up the UV space
	st = grid(st, 3, 3);
	//COLOR = vec4(col, 1.0);
	COLOR = vec4(st.rg, 0., 1.);
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}