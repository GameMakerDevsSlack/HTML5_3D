return game_width()*clamp( ( device_mouse_raw_x( argument0 ) - window_get_x() ) / ( window_get_width()/dpi ), 0, 1 );
//if ( argument0 == 0 ) return device_mouse_x( argument0 );
//return dpi*device_mouse_x( argument0 );