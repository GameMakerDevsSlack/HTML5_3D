matrix_set( matrix_world, matrix_build( x, y, z,
                                        -90, 0, 0,
										1, 1, 1 ) );
vertex_submit( global.vbf_spiral, pr_trianglelist, sprite_get_texture( spr_tex_spiral, 0 ) );