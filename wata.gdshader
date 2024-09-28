shader_type spatial;

uniform sampler2D water_normal_noise;
uniform vec3 water_color: source_color;
uniform float time_scale: hint_range(0.0, 10.0, 0.25) = 1;

uniform float alpha_slider : hint_range(0.0, 1.0, 0.1) = 1.0;
uniform float uv_scale : hint_range(0.0, 10.0, 0.25) = 1.0;

uniform sampler2D screen_texture: hint_screen_texture,repeat_disable;
uniform sampler2D sunHighlight;
void vertex() {
	// Called for every vertex the material is visible on.

}

void fragment() {

	vec2 _uv = UV*uv_scale;
	vec2 _suv = SCREEN_UV;

	_uv.x += sin(TIME * time_scale + (_uv.x + _uv.y) * 25. ) *0.01;
	_uv.y += cos(TIME * time_scale + (_uv.x - _uv.y) * 25. ) *0.01;
	// Called for every pixel the material is visible on.
	_suv.x += sin(TIME * time_scale + (_suv.x + _suv.y) * 25. ) *0.01;
	_suv.y += cos(TIME * time_scale + (_suv.x - _suv.y) * 25. ) *0.01;

	NORMAL_MAP = texture(water_normal_noise,UV).rgb;
	NORMAL*=0.5;
	ALBEDO = texture(screen_texture, SCREEN_UV).rgb;
	ROUGHNESS *= 0.2;

	ALPHA = 0.5;

}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
