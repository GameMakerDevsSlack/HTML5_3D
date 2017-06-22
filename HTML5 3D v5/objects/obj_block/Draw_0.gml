matrix_set( matrix_world, matrix_build( x, y, z,
                                        0, 0, 0,
						                32, 32, 100 ) );
vertex_submit( global.vbf_cube, pr_trianglelist, sprite_get_texture( spr_floor, 0 ) );