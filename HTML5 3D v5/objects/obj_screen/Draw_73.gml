shader_reset();

matrix_set( matrix_world     , matrix_build_identity() );
matrix_set( matrix_view      , old_view_matrix );
matrix_set( matrix_projection, old_proj_matrix );