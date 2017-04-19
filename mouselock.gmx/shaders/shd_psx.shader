attribute vec3 in_Position;
attribute vec2 in_TextureCoord;
attribute vec4 in_Colour;
attribute vec3 in_Normal;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;
varying vec3 affine;

uniform vec4 u_vAmbientColour;

vec4 DoLight(vec3 ws_pos, vec3 ws_normal, vec4 posrange, vec4 diffusecol)
{
    vec3 diffvec = ws_pos - posrange.xyz;
    float veclen = length(diffvec);
    diffvec /= veclen;
    float atten = clamp( (1.0 - (veclen / posrange.w)), 0.0, 1.0);
    float dotresult = dot(ws_normal, diffvec);
    dotresult = max(0.0, dotresult);
    return dotresult * atten * diffusecol;
}

vec4 DoLighting2(vec4 vertexcolour, vec4 objectspacepos)
{
    vec3 ws_pos = (gm_Matrices[MATRIX_WORLD] * objectspacepos).xyz;
    
    vec4 accumcol = vec4(0.0, 0.0, 0.0, 1.0);
    
    for (int i = 0; i < MAX_VS_LIGHTS; i++){
        accumcol += DoLight(ws_pos, -normalize(in_Normal), gm_Lights_PosRange[i], gm_Lights_Colour[i]);
    }
    
    //accumcol.rgb *= .3;
    accumcol *= vertexcolour;
    accumcol = min(vec4(1.0), accumcol);
    //accumcol += gm_AmbientColour;
    return accumcol;
}

void main() {
    
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos; 
    
    gl_Position.xyz /= gl_Position.w;
    gl_Position.x = (floor(gl_Position.x * 80.0) / 80.0);
    gl_Position.y = (floor(gl_Position.y * 60.0) / 60.0);
    gl_Position.xyz *= gl_Position.w;
    
    affine = vec3(in_TextureCoord.x * gl_Position.z, in_TextureCoord.y * gl_Position.z, gl_Position.z);
    v_vColour = DoLighting2(in_Colour, object_space_pos) + CalcFogFactor(object_space_pos);
    v_vTexcoord = in_TextureCoord;
    v_vNormal = in_Normal;
    
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;
varying vec3 affine;

void main() {
    
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
    vec2 uv = affine.xy / affine.z;
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, uv );
    
}
