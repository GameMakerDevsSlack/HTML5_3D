frame_start_time = get_timer();

draw_clear( c_black );
old_view_matrix = matrix_get( matrix_view );
old_proj_matrix = matrix_get( matrix_projection );

gpu_set_ztestenable( true );
gpu_set_zwriteenable( true );
gpu_set_cullmode( cull_counterclockwise );
shader_set( shd_psx );

var _light = 0;
with( obj_camera ) {
	psx_set_light( _light, x, y, z, 100, c_dkgray, 1 );
	_light++;
}
with( obj_light ) {
    if ( visible ) {
		psx_set_light( _light, x, y, z, range, colour, 1 );
	} else {
		psx_set_light( _light, x, y, z, 0, c_black, 0 );
	}
    _light++;
}

shader_set_uniform_f( shader_get_uniform( shd_psx, "u_vAmbientColour" ), 0.1, 0.08, 0.13, 0.0 );

draw_set_colour( c_white );
camera_set_projection();