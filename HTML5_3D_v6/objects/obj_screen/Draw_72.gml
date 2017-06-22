frame_start_time = get_timer();

draw_clear( c_black );

if ( do_3d ) {
	
	old_view_matrix = matrix_get( matrix_view );
	old_proj_matrix = matrix_get( matrix_projection );

	gpu_set_ztestenable( true );
	gpu_set_zwriteenable( true );
	gpu_set_cullmode( cull_counterclockwise );
	
	lighting_shader_set();
	lighting_set_ambience( 26, 20, 33, 0.00 );
	
	var _light = 0;
	with( obj_camera ) {
		lighting_set_light( _light, x, y, z, 100, c_dkgray, 1 );
		_light++;
	}
	with( obj_light ) {
	    if ( visible ) {
			lighting_set_light( _light, x, y, z, range, colour, 1 );
		} else {
			lighting_set_light( _light, x, y, z, 0, c_black, 0 );
		}
	    _light++;
	}
	
	draw_set_colour( c_white );
	camera_set_projection();
}