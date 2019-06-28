shader_type canvas_item;
render_mode blend_mix;

uniform float runtime;

void fragment()
{
	COLOR = texture(TEXTURE,UV);
	if(COLOR.w > 0.0)
	{
		COLOR.w -= min(runtime/3.0, 0.25);
		COLOR.x += runtime/3.0 ;
		COLOR.y += runtime/6.0;
	}		
}