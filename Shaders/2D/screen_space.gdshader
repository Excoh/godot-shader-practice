shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, filter_linear, repeat_disable;

void fragment() {
	// Called for every pixel the material is visible on.
	// Screen texture is used to grab the viewport texture
	// and SCREEN_UV is the UV value where that fragment
	// lies on the screen
	vec4 c = textureLod(screen_texture, SCREEN_UV, 0.0);
	if (c.b >= 0.5) {
		vec4 d = textureLod(screen_texture, SCREEN_UV+vec2(0.01,0.01), 3.0);
		c.rgb=d.rgb;
	}
    COLOR = c;
}
