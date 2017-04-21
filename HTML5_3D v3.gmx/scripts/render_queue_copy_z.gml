///render_queue_copy_z()

if ( global.render_pass == e_render.zwrite ) {
    
    surface_set_target( global.render_zsurf );
    if ( in_browser() ) shader_set( shd_z_copy_flipped ) else shader_set( shd_z_copy );
    draw_surface( application_surface, 0, 0 );
    shader_reset();
    surface_reset_target();
    
    with( obj_example ) d3d_set_projection_ext( x, y, z,   look_x, look_y, look_z,   0, 0, 1,   60, view_wview[0]/view_hview[0], 1, 8000 );
    
}
