with( obj_camera ) {
	camera_set_view_mat( camera_get_active(), matrix_build_lookat( x, y, z, 
								                                   look_x, look_y, look_z,
								                                   0, 0, 1 ) );
    camera_set_proj_mat( camera_get_active(), matrix_build_projection_perspective_fov( -60, -640/960, 1, 10000 ) );
	camera_apply( camera_get_active() );
}