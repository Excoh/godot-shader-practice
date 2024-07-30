shader_type canvas_item;

uniform vec2 grid_size = vec2(3., 3.);

// Subdivide a uv space
// by a number of column and rows.
// Each subspace will range from 0-1
vec2 grid(vec2 uv, float col, float row) {
	return fract(uv * vec2(col, row));
}

float circle(vec2 st) {
	vec2 l = st - vec2(0.5);
	// Here's another way to create a circle without using the distance
	// and length functions. By using dot()
	return 1. - (dot(l,l)*4.0);
}

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec2 st = UV;
	// Scale up the UV space
	st = grid(st, grid_size.x, grid_size.y);
	//COLOR = vec4(col, 1.0);
	COLOR = vec4(vec3(circle(st)), 1.);
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}