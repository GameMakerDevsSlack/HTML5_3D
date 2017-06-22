varying vec3 v_vLight;
varying vec3 v_vScoord;
varying vec4 v_vColour;

const float m = 16.0;
const float p = 3.141592653589793238462643;

uniform sampler2D depthmap;
uniform float depthsize;
uniform vec3 lightcol;
uniform vec4 ambcol;
uniform float mode;

float vtof(vec3 v)
{
    return (v.r*65536.0+v.g*256.0+v.b);
}
float hard( sampler2D depth, vec3 coord, vec2 size, float bias )
{
    vec4 c = vec4( floor( coord.xy * size.xy + 0.5) / size.xy, 1.0/size.xy );
    float d = vtof( texture2D( depth, c.xy ).rgb );

    return clamp((d-coord.z+bias)/bias,0.0,1.0);
}
void main()
{
    vec2 scoord = 0.5 * vec2( v_vScoord.x / v_vScoord.z + 1.0, 1.0 - v_vScoord.y / v_vScoord.z );
    float light = clamp( hard( depthmap, vec3( scoord, v_vScoord.z ), vec2( 1024.0 ), 1.0 ), 0.0, 1.0 );
    light = clamp( light * max(dot(vec3(0.0,0.0,-1.0),v_vLight),0.0),0.0,1.0)*max(1.0-length(scoord-vec2(0.5,0.5))*2.0,0.0);
    gl_FragColor = v_vColour * vec4( mix( ambcol.rgb, ambcol.rgb + lightcol, ambcol.a * light ), 1.0 );
    
}