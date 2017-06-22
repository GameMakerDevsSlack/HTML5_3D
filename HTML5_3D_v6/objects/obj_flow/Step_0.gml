resizer_step();

if ( room == rm_splash ) {
	if ( global.on_mobile ) {
		
		if ( mouse_get_released(0) ) {
			//audio_master_gain( mouse_get_x(0) < room_width div 2 );
			room_goto_next();
			obj_screen.do_3d = true;
		}
		
	} else {
		
		//audio_master_gain( 1 );
		room_goto_next();
		obj_screen.do_3d = true;
		
	}
}