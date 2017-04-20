attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_vTextureSize;
uniform sampler2D u_sDither;

float dither_find( vec2 pos, float value ){
    return step( (255.0/64.0) * texture2D( u_sDither, pos/8.0 ).r, floor( value * 228.0 ) / 128.0 );
}

float luma( vec4 colour ) {
    return ( (colour.r + colour.b + colour.g) / 3.0 );
}

void main() {
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = vec4( mix( col.rgb, col.rgb * dither_find( mod( v_vTexcoord * u_vTextureSize, 8.0 ), luma(col) ), 0.2 ), 1.0 );
}
