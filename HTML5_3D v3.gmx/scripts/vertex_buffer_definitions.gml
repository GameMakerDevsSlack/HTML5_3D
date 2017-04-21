///vertex_buffer_definitions()

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_textcoord();
vertex_format_add_colour();
vertex_format_add_normal();
global.vft_simple = vertex_format_end();



global.vbf_cube = model_load_ext_zoltan( "cube.obj", false, 4, 0, 4, 1 );



global.vbf_floor = vertex_create_buffer();
var _vbuff = global.vbf_floor;
vertex_begin( _vbuff, global.vft_simple );

for( var _x = 0; _x < 320; _x += 64 ) {
    for( var _y = 0; _y < 320; _y += 64 ) {
        
        var _p_l = _x;
        var _p_t = _y;
        var _p_r = _x + 64;
        var _p_b = _y + 64;
        
        vertex_position_3d( _vbuff, _p_l, _p_t, 0 ); vertex_texcoord( _vbuff, 0, 0 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 0, 1 );
        vertex_position_3d( _vbuff, _p_r, _p_t, 0 ); vertex_texcoord( _vbuff, 1, 0 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 0, 1 );
        vertex_position_3d( _vbuff, _p_l, _p_b, 0 ); vertex_texcoord( _vbuff, 0, 1 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 0, 1 );
        
        vertex_position_3d( _vbuff, _p_r, _p_t, 0 ); vertex_texcoord( _vbuff, 1, 0 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 0, 1 );
        vertex_position_3d( _vbuff, _p_r, _p_b, 0 ); vertex_texcoord( _vbuff, 1, 1 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 0, 1 );
        vertex_position_3d( _vbuff, _p_l, _p_b, 0 ); vertex_texcoord( _vbuff, 0, 1 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 0, 1 );
        
    }
}

vertex_end( _vbuff );



global.vbf_ceiling = vertex_create_buffer();
var _vbuff = global.vbf_ceiling;
vertex_begin( _vbuff, global.vft_simple );

for( var _x = 0; _x < 320; _x += 64 ) {
    for( var _y = 0; _y < 320; _y += 64 ) {
        
        var _p_l = _x;
        var _p_t = _y;
        var _p_r = _x + 64;
        var _p_b = _y + 64;
        
        vertex_position_3d( _vbuff, _p_r, _p_t, 0 ); vertex_texcoord( _vbuff, 1, 0 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 0, -1 );
        vertex_position_3d( _vbuff, _p_l, _p_t, 0 ); vertex_texcoord( _vbuff, 0, 0 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 0, -1 );
        vertex_position_3d( _vbuff, _p_l, _p_b, 0 ); vertex_texcoord( _vbuff, 0, 1 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 0, -1 );
        
        vertex_position_3d( _vbuff, _p_r, _p_b, 0 ); vertex_texcoord( _vbuff, 1, 1 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 0, -1 );
        vertex_position_3d( _vbuff, _p_r, _p_t, 0 ); vertex_texcoord( _vbuff, 1, 0 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 0, -1 );
        vertex_position_3d( _vbuff, _p_l, _p_b, 0 ); vertex_texcoord( _vbuff, 0, 1 ); vertex_colour( _vbuff, c_white, 1 ); vertex_normal( _vbuff, 0, 0, -1 );
        
    }
}

vertex_end( _vbuff );
