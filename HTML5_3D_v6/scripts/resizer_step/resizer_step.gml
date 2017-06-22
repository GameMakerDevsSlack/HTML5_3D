if ( no_flip > 0 ) {
	
    no_flip--;
	
} else if ( global.on_browser ) {
	
	var _force = false;
	
	if ( js_call("resized") ) or ( last_room != room ) or ( do_refresh ) or ( _force ) {
		
	    do_refresh = false;
	    last_room = room;
		
	    var _game_w = game_width();
	    var _game_h = game_height();
	    var _game_w_old = _game_w;
	    var _game_h_old = _game_h;
		
	    do_flip = ( ( browser_width/browser_height > 1 ) != ( _game_w_old/_game_h_old > 1 ) );
		/*if ( ( global.on_mobile ) and ( do_flip ) ) or ( _force ) {
			
			if ( priority != 0 ) priority = 3 - priority;
			
			if ( room == rm_flip ) {
				room_goto( return_room );
			} else {
				instance_deactivate_all( true );
				return_room = room;
				room_persistent = true;
				room_goto( rm_flip );
			}
			
		}*/
		
	    var _x_scale = browser_width / _game_w;
	    var _y_scale = browser_height / _game_h;
	    if ( priority == 1 ) _y_scale = _x_scale;
	    if ( priority == 2 ) _x_scale = _y_scale;
    
	    if ( max_x_scale != 0 ) _x_scale = min( _x_scale, max_x_scale );
	    if ( min_x_scale != 0 ) _x_scale = max( _x_scale, min_x_scale );
	    if ( max_y_scale != 0 ) _y_scale = min( _y_scale, max_y_scale );
	    if ( min_y_scale != 0 ) _y_scale = max( _y_scale, min_y_scale );
	    _game_w *= _x_scale;
	    _game_h *= _y_scale;
	
	    if ( MAX_WIDTH  != 0 ) and ( _game_w > MAX_WIDTH  ) _game_w = MAX_WIDTH;
	    if ( MAX_HEIGHT != 0 ) and ( _game_h > MAX_HEIGHT ) _game_h = MAX_HEIGHT;
    
	    _x_scale = _game_w / _game_w_old;
	    _y_scale = _game_h / _game_h_old;
    
	    if ( PROPORTIONAL ) {
	        _x_scale = min( _x_scale, _y_scale );
	        _y_scale = _x_scale;
	    }
		
	    _game_w = round( _game_w_old * _x_scale );
	    _game_h = round( _game_h_old * _y_scale );
		
	    var _left = ALIGN_H*0.5*( browser_width - _game_w );
	    var _top = 1 + ALIGN_V*0.5*( browser_height - _game_h );
		
	    if ( RESTRICT_H > 0 ) _left = max( _left, 0 );
	    if ( RESTRICT_H < 0 ) _left = min( _left, browser_width - _game_w );
	    if ( RESTRICT_V > 0 ) _top = max( _top, 0 );
	    if ( RESTRICT_V < 0 ) _top = min( _top, browser_height - _game_h );
		
	    window_set_position( _left, _top );
		dpi = js_call( "dpi_scale" );
		window_set_size( dpi*_game_w, dpi*_game_h );
		js_call3( "set_size", window_handle(), _game_w, _game_h );
		js_call1( "scroll_down", browser_height );
	
	}

}
