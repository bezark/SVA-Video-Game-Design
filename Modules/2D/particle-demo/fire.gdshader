shader_type canvas_item;
render_mode blend_add;
uniform float s_scale_y = 1.0;
uniform float l_s_scale_y = 1.0;
uniform float lness = 1.0;
uniform float lness2 = .0;
uniform sampler2D noise : repeat_enable, filter_nearest_mipmap_anisotropic;
uniform sampler2D noise2 : repeat_enable, filter_nearest_mipmap_anisotropic;
uniform sampler2D colo_curve;

vec4 f1(vec2 uv, float time){
	vec4 nv2 = texture(noise, uv + vec2(time, 0.0));
	vec4 n2v2 = texture(noise2, uv + vec2(time*.8, 0.0));
	nv2.a = max(0., nv2.a + uv.x - 1.0);
	n2v2.a = max(0., n2v2.a + uv.x - 1.0);
	return nv2 * n2v2;
}

void fragment()
{
	vec2 mUV = UV * 4. - 1.5;
	vec2 uv = mUV * vec2(1., s_scale_y);
	float time = TIME;
    vec2 cuv = mUV - vec2(.5);
	float d2c = length(cuv);
	vec4 color = COLOR;
	//
	color *= (f1(uv, time) + f1(uv + vec2(.1,0.), time+11.514) + f1(uv+vec2(.05,0.), time+14.14));

	color.a -= 1.0;
	color.a = - pow(color.a, 2.0) + 1.0;
	//
	color.rgb = texture(colo_curve, vec2(color.a,0.)).rgb;
	float randmoo = texture(noise2, mUV + vec2(time, -time)).a;
	randmoo = mix(randmoo, 0., mUV.x);
    color.a *= smoothstep(.5, .48 - (.2 - min(mUV.x, 1.0)*.2), d2c + randmoo * 0.4);
    COLOR = color;
	COLOR.rgb = mix(COLOR.rgb, vec3(.0), smoothstep(0.00001, 0.0, color.a));
	// light
	float d2c_l = length(UV * vec2(1., l_s_scale_y) - vec2(.58, .5*l_s_scale_y));
	float l = - log(d2c_l + lness2) * lness;
	float randmoo2 = texture(noise2, vec2(time, -time)).a;

	COLOR += texture(colo_curve, vec2(1.0-d2c_l - .1*randmoo2, 0.0)) * l;
	//COLOR += vec4(.8, .8, .6, 1.0) * l;
	//
	COLOR.a *= smoothstep(0.5, 0.1, length(UV - vec2(.5)));
}
