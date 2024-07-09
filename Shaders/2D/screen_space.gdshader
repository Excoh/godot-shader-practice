shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture;

uniform float brightness = 1.0;
uniform float contrast = 1.0;
uniform float saturation = 1.0;

void fragment() {
	// Called for every pixel the material is visible on.
	vec3 c = textureLod(screen_texture, SCREEN_UV, 0.0).rgb;
	if (c.b >= 0.75) {
		c.rgb = vec3(0.);
	}

    COLOR.rgb = c;
}
