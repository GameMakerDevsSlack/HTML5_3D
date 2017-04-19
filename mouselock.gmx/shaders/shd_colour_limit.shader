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

int dither[64];

float dither_find(int X, int Y, float value){
    dither[0] = 0;
    dither[1] = 32;
    dither[2] = 8;
    dither[3] = 40;
    dither[4] = 2;
    dither[5] = 34;
    dither[6] = 10;
    dither[7] = 42;
    dither[8] = 48;
    dither[9] = 16;
    dither[10] = 56;
    dither[11] = 24;
    dither[12] = 50;
    dither[13] = 18;
    dither[14] = 58;
    dither[15] = 26;
    dither[16] = 12;
    dither[17] = 44;
    dither[18] = 4;
    dither[19] = 36;
    dither[20] = 14;
    dither[21] = 46;
    dither[22] = 6;
    dither[23] = 38;
    dither[24] = 60;
    dither[25] = 28;
    dither[26] = 52;
    dither[27] = 20;
    dither[28] = 62;
    dither[29] = 30;
    dither[30] = 54;
    dither[31] = 22;
    dither[32] = 3;
    dither[33] = 35;
    dither[34] = 11;
    dither[35] = 43;
    dither[36] = 1;
    dither[37] = 33;
    dither[38] = 9;
    dither[39] = 41;
    dither[40] = 51;
    dither[41] = 19;
    dither[42] = 59;
    dither[43] = 27;
    dither[44] = 49;
    dither[45] = 17;
    dither[46] = 57;
    dither[47] = 25;
    dither[48] = 15;
    dither[49] = 47;
    dither[50] = 7;
    dither[51] = 39;
    dither[52] = 13;
    dither[53] = 45;
    dither[54] = 5;
    dither[55] = 37;
    dither[56] = 63;
    dither[57] = 31;
    dither[58] = 55;
    dither[59] = 23;
    dither[60] = 61;
    dither[61] = 29;
    dither[62] = 53;
    dither[63] = 21;

    float match = float(dither[8 * Y + X]) / 64.0;

    if ((floor(value * 228.0) / 128.0) > match){
       return 1.0;
    }else{
       return 0.0;   
    }
    
}

float luma(vec4 color) {
  return ((color.r + color.b + color.g) / 3.0);
}

void main()
{
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );   
    int X = int(mod((v_vTexcoord.x * 320.0), 8.0));
    int Y = int(mod((v_vTexcoord.y * 240.0), 8.0));
    gl_FragColor = vec4(mix(col.rgb, col.rgb * dither_find(X, Y, luma(col)), 0.2), 1.0);
}
