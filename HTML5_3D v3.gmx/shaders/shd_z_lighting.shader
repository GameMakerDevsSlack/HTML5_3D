attribute vec3 in_Position;
attribute vec2 in_TextureCoord;
attribute vec4 in_Colour;
attribute vec3 in_Normal;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 v_vPosition;
varying float v_fDepth;

uniform vec4 u_vAmbientColour;

vec4 DoLight(vec3 ws_pos, vec3 ws_normal, vec4 posrange, vec4 diffusecol) {
    vec3 diffvec = ws_pos - posrange.xyz;
    float veclen = length(diffvec);
    diffvec /= veclen;
    float atten = clamp( (1.0 - (veclen / posrange.w)), 0.0, 1.0);
    float dotresult = dot(ws_normal, diffvec);
    dotresult = max(0.0, dotresult);
    return dotresult * atten * diffusecol;
}

vec4 DoLighting2(vec4 vertexcolour, vec4 objectspacepos) {
    vec3 ws_pos = (gm_Matrices[MATRIX_WORLD] * objectspacepos).xyz;
    
    vec4 accumcol = vec4(0.0, 0.0, 0.0, 1.0);
    
    for (int i = 0; i < MAX_VS_LIGHTS; i++){
        accumcol += DoLight(ws_pos, -normalize(in_Normal), gm_Lights_PosRange[i], gm_Lights_Colour[i]);
    }
    
    accumcol *= vertexcolour;
    accumcol += u_vAmbientColour;
    accumcol = min(vec4(1.0), accumcol);
    return accumcol;
}

void main() {
    
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    vec4 object_screen_pos = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    gl_Position = object_screen_pos;
    
    v_vTexcoord = in_TextureCoord;
    v_vPosition = gl_Position;
    v_fDepth = (gm_Matrices[MATRIX_WORLD_VIEW] * object_space_pos).z / 768.0;
    v_vColour = DoLighting2(in_Colour, object_space_pos);
    v_vColour.a = 1.0 - clamp( ( v_fDepth - 0.01 ) / 0.99, 0.0, 1.0 );
    
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 v_vPosition;
varying float v_fDepth;

uniform sampler2D u_sDepth;

float unpackDepth( vec3 colourRGB ){
    return clamp(float((colourRGB.r)+(colourRGB.g/255.0)+(colourRGB.b/(255.0*255.0))), 0.0, 1.0);
}

vec3 packDepth(float f) {
    return vec3( floor( f * 255.0 ) / 255.0, fract( f * 255.0 ), fract( f * 255.0 * 255.0 ) );
}

void main() {
    
    vec2 texcoord = 0.5 + ( 0.5*v_vPosition.xy/v_vPosition.w );
    float sampleDepth = unpackDepth( texture2D( u_sDepth, texcoord ).rgb ) + 0.002;
    if ( sampleDepth < v_fDepth ) discard;
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
}
