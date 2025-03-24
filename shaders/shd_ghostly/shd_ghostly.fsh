//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//uniform vec3 new_color;

void main()
{
	vec3 starting_color = (v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )).rgb;
	float alpha = (v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )).a;

	float value = dot(starting_color, vec3(0.299, 0.587, 0.114));
	float normalized = (value - 0.2) / (0.8 - 0.4);

	
    vec3 color1 = vec3(0.25, 0.33, 0.52); // Purple
	vec3 color2 = vec3(0.60, 0.81, 0.89); // Red
	vec3 color3 = vec3(0.88, 0.99, 1.00); // Light
	
	float pos1 = 0.0;
    float pos2 = 0.4;
    float pos3 = 1.0;
	
    if (normalized < pos2) {
        // Interpolate between color1 and color2
        float oga = (normalized - pos1) / (pos2 - pos1);
        gl_FragColor = vec4(mix(color1, color2, oga), alpha);
    } else {
        // Interpolate between color2 and color3
        float oga = (normalized - pos2) / (pos3 - pos2);
        gl_FragColor = vec4(mix(color2, color3, oga), alpha);
    }
	
}
