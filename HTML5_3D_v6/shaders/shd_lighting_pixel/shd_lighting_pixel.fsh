varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 v_vPos;
varying vec3 v_vNormal;
varying mat4 v_mWorld;

uniform vec4 u_vLightPosRange0;
uniform vec4 u_vLightColour0;
uniform vec4 u_vLightPosRange1;
uniform vec4 u_vLightColour1;
uniform vec4 u_vLightPosRange2;
uniform vec4 u_vLightColour2;
uniform vec4 u_vLightPosRange3;
uniform vec4 u_vLightColour3;
uniform vec4 u_vLightPosRange4;
uniform vec4 u_vLightColour4;
uniform vec4 u_vLightPosRange5;
uniform vec4 u_vLightColour5;
uniform vec4 u_vLightPosRange6;
uniform vec4 u_vLightColour6;
uniform vec4 u_vLightPosRange7;
uniform vec4 u_vLightColour7;
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

vec4 DoLighting2( vec4 vertexcolour, vec4 objectspacepos ) {
    vec3 ws_pos = (v_mWorld * objectspacepos).xyz;
    vec3 ws_norm = (v_mWorld * vec4( v_vNormal, 0.0 ) ).xyz;
    ws_norm /= -length( ws_norm );
    vec4 accumcol = vec4(0.0, 0.0, 0.0, 1.0);
    
    accumcol += DoLight(ws_pos, ws_norm, u_vLightPosRange0, u_vLightColour0);
    accumcol += DoLight(ws_pos, ws_norm, u_vLightPosRange1, u_vLightColour1);
    accumcol += DoLight(ws_pos, ws_norm, u_vLightPosRange2, u_vLightColour2);
    accumcol += DoLight(ws_pos, ws_norm, u_vLightPosRange3, u_vLightColour3);
    accumcol += DoLight(ws_pos, ws_norm, u_vLightPosRange4, u_vLightColour4);
    accumcol += DoLight(ws_pos, ws_norm, u_vLightPosRange5, u_vLightColour5);
    accumcol += DoLight(ws_pos, ws_norm, u_vLightPosRange6, u_vLightColour6);
    accumcol += DoLight(ws_pos, ws_norm, u_vLightPosRange7, u_vLightColour7);
    
    accumcol *= vertexcolour;
    accumcol += u_vAmbientColour;
    accumcol = min(vec4(1.0), accumcol);
    return accumcol;
}

void main() {
    gl_FragColor = DoLighting2( v_vColour, v_vPos ) * texture2D( gm_BaseTexture, v_vTexcoord );
}
