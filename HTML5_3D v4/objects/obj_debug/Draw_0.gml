for( var _y = 0; _y < 960; _y += 320 ) {
    for( var _x = 0; _x < 960; _x += 320 ) {
		matrix_set( matrix_world, matrix_build( _x, _y, 0,
		                                         0,  0, 0,
												 1,  1, 1 ) );
        vertex_submit( global.vbf_floor, pr_trianglelist, sprite_get_texture( spr_floor, 0 ) );
		matrix_set( matrix_world, matrix_build( _x, _y, 100,
		                                         0,  0,   0,
												 1,  1,   1 ) );
        vertex_submit( global.vbf_ceiling, pr_trianglelist, sprite_get_texture( spr_floor, 0 ) );
    }
}