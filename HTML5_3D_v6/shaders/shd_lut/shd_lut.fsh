varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D s_Lut;
uniform float u_Mix;

const float LUT_SIZE = 512.0;
const float BLUE_SIZE = 8.0;

void main() {
	
    vec4 sample = texture2D( gm_BaseTexture, v_vTexcoord );
    float blue = sample.b * ( BLUE_SIZE*BLUE_SIZE - 1.0 );
	
	float blueFloor = floor( blue );
    vec2 quad1 = vec2( blueFloor, floor( blueFloor/BLUE_SIZE ) );
    quad1.x -= quad1.y * BLUE_SIZE;
	
	float blueCeil  = ceil( blue );
    vec2 quad2 = vec2( blueCeil, floor( blueCeil/BLUE_SIZE ) );
    quad2.x -= quad2.y * BLUE_SIZE;
	
    vec3 new = mix( texture2D( s_Lut, quad1/BLUE_SIZE + 0.5/LUT_SIZE + (1.0/BLUE_SIZE - 1.0/LUT_SIZE)*sample.rg ).rgb,
	                texture2D( s_Lut, quad2/BLUE_SIZE + 0.5/LUT_SIZE + (1.0/BLUE_SIZE - 1.0/LUT_SIZE)*sample.rg ).rgb,
					fract( blue ) );    
    
    gl_FragColor = v_vColour * vec4( mix( sample.rgb, new, u_Mix ), 1.0 );
	
}