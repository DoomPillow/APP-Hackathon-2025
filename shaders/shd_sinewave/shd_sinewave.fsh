//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_time;

void main()
{
	
	float frequency = 15.0; //frequency
	float amplitude = 0.01; //amplitude
	
    vec2 uv = v_vTexcoord;
    uv.x += sin((uv.y * frequency) + (u_time*0.05)) * amplitude;
    gl_FragColor = texture2D(gm_BaseTexture, uv);
}

