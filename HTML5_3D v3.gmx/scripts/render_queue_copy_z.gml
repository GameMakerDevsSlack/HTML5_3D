///render_queue_copy_z()

if ( global.render_pass == e_render.zwrite ) {
    
    surface_set_target( global.render_zsurf );
    if ( in_browser() ) shader_set( shd_z_copy_flipped ) else shader_set( shd_z_copy );
    draw_surface( application_surface, 0, 0 );
    shader_reset();
    surface_reset_target();
    camera_set_projection();
    
}
