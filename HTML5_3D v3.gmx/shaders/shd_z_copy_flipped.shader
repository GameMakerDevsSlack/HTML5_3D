attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    gl_Position = vec4( in_TextureCoord*2.0 - 1.0, 1.0, 1.0 );
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;

void main() {
    gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord );
}

