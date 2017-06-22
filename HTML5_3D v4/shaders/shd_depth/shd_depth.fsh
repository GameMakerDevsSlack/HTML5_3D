varying vec2 v_vTexcoord;
varying float depth;

vec3 ftov(float f)
{
    return vec3(floor(f/256.0)/256.0,fract(f/256.0),fract(floor(f*256.0)/256.0));
}
float vtof(vec3 v)
{
    return (v.r*65536.0+v.g*256.0+v.b);
}

void main()
{
    float alpha = floor(0.5+texture2D(gm_BaseTexture,v_vTexcoord).a);
    gl_FragColor = vec4(ftov(depth),alpha);
}