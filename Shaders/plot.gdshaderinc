uniform vec3 LINE_COLOR : source_color = vec3(0.0, 1.0, 0.0);

float plot(vec2 st, float pct) {
	return smoothstep(pct-0.02, pct, st.y) - smoothstep(pct, pct+0.02, st.y);
}