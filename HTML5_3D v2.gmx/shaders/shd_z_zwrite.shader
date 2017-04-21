attribute vec3 in_Position;
attribute vec2 in_TextureCoord;
attribute vec4 in_Colour;
attribute vec3 in_Normal;

varying vec2 v_vTexcoord;
varying vec4 v_vPosition;
varying float v_fDepth;

void main() {
    
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    vec4 object_screen_pos = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    gl_Position = object_screen_pos;
    
    v_vTexcoord = in_TextureCoord;
    v_vPosition = gl_Position;
    v_fDepth = (gm_Matrices[MATRIX_WORLD_VIEW] * object_space_pos).z / 1000.0;
    
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vPosition;
varying float v_fDepth;

float unpackDepth( vec3 colourRGB ){
    return clamp(float((colourRGB.r)+(colourRGB.g/255.0)+(colourRGB.b/(255.0*255.0))), 0.0, 1.0);
}

vec3 packDepth(float f) {
    return vec3( floor( f * 255.0 ) / 255.0, fract( f * 255.0 ), fract( f * 255.0 * 255.0 ) );
}

void main() {
    
    vec2 texcoord = 0.5 + ( 0.5*v_vPosition.xy/v_vPosition.w );
    float sampleDepth = unpackDepth( texture2D( gm_BaseTexture, texcoord ).rgb );
    //if ( sampleDepth < v_fDepth ) discard;
    gl_FragColor = vec4( packDepth( v_fDepth ), step( v_fDepth, sampleDepth ) );
    
}
