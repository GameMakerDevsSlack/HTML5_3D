if ( do_dither ) {
    
	if ( !surface_exists( global.dither_surface ) ) {
		global.dither_surface = dither_make_surface();
		global.dither_texture = surface_get_texture( global.dither_surface );
	}
	
    shader_set( shd_dither );
    texture_set_stage( shader_get_sampler_index( shd_dither, "u_sDither" ), global.dither_texture );
    shader_set_uniform_f( shader_get_uniform( shd_dither, "u_vTextureSize" ), 320, 240 );
    draw_surface_ext( application_surface, 0, 0, 1, 1, 0, c_white, 1 );
    shader_reset();
    
} else {
    
    if ( !keyboard_check( ord( "K" ) ) ) draw_surface_ext( application_surface, 0, 0, 1, 1, 0, c_white, 1 );
	trace_m( "screen", display_get_gui_width(), display_get_gui_height(), surface_get_width( application_surface ), surface_get_height( application_surface ) );
	
}

frame_time = get_timer() - frame_start_time;
smoothed_timer = lerp( smoothed_timer, frame_time, 0.1 );