shader_type canvas_item;
render_mode blend_mix;
void fragment() {
	float j1 = 0.0;
	float j2 = 0.0;
	float xAbs = distance(UV,vec2(0.5,UV.y));
	float yAbs = distance(UV,vec2(UV.x,0.5));
	if(xAbs > 0.15)
		j1 = (xAbs - 0.15) / 0.35;
	if(yAbs > 0.25)
		j2 = (yAbs - 0.25) / 0.25;
	if(j2 > j1)
		j1 = j2;
	COLOR = vec4(1.0-j1,0,0,1.0-j1);
	if(distance(UV,vec2(0.5,0.5)) < 0.2)
		COLOR = vec4(1.0-j1,0,0,0.0);
//	COLOR = vec4(1.0,0,0,1.0 - j1);
	//COLOR = vec4(0.75,0,0,1.0 - (j1+j2));
}