attribute vec3 in_Position;
attribute vec3 in_Normal;
attribute vec4 in_Colour;

varying vec3 v_vLight;
varying vec3 v_vScoord;
varying vec4 v_vColour;

uniform mat4 lightmatrix;

void main()
{
    vec4 object_space_pos = vec4( in_Position, 1.0);
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    vec4 norm = gm_Matrices[MATRIX_WORLD] * vec4( normalize( in_Normal ), 0.0 );
    vec4 pos = gm_Matrices[MATRIX_WORLD] * object_space_pos;
    
    v_vLight    = (lightmatrix * norm).xyz;
    v_vScoord   = (lightmatrix * pos).xyz;
    v_vColour   = in_Colour;
    
}