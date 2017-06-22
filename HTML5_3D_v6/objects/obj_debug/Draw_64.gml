var _str = "";
_str += "CLICK TO LOCK MOUSE!";
if ( !global.on_browser ) _str += "\nSPACE TO UNLOCK MOUSE!";
_str += "\nWASD TO MOVE!";

if ( debug_visible ) {
    
    _str += "\nFPS=" + string_format( fps, 4, 0 ) + "  ";
    _str += "\nSMOOTHED DRAW TIME=" + string_format( obj_screen.smoothed_timer, 4, 0 ) + "us";
    
    var _listener_data = audio_listener_get_data( 0 );
    _str += "\n\nLISTENER X=" + string_format( _listener_data[? "x" ], 4, 2 );
    _str += "\nLISTENER Y=" + string_format( _listener_data[? "y" ], 4, 2 );
    _str += "\nLISTENER Z=" + string_format( _listener_data[? "z" ], 4, 2 );
    if ( global.on_browser ) _str += "\nLOCKED: " + mouse_is_locked();
	
	draw_set_colour( c_black );
	draw_set_alpha( 0.3 );
	draw_rectangle(  10, 10, 210, 110, false );
	draw_rectangle( 220, 10, 420, 110, false );
	draw_set_alpha( 1 );
	
	draw_set_color( c_white );
	var _size = ds_list_size( lst_frame_time );
	for( var _i = 0; _i < _size; _i++ ) {
		draw_point( 10 + 2*_i, 10 + 100 - 100*lst_frame_time[| _i ]/16667 );
		draw_point( 11 + 2*_i, 10 + 100 - 100*lst_frame_time[| _i ]/16667 );
	}
	
	var _size = ds_list_size( lst_smoothed_timer );
	for( var _i = 0; _i < _size; _i++ ) {
		draw_point( 220 + 2*_i, 10 + 100 - 100*lst_smoothed_timer[| _i ]/16667 );
		draw_point( 221 + 2*_i, 10 + 100 - 100*lst_smoothed_timer[| _i ]/16667 );
	}
	
} else {
    
    _str += "\nPRESS 1 TO SHOW DEBUG!";
    
}

shader_reset();
draw_set_font( fnt_default );
draw_set_color( c_white );
draw_set_halign( fa_right );
draw_text( 950, 10, _str );
draw_set_halign( fa_left );