surface_resize( application_surface, 640, 960 );
application_surface_draw_enable( false );

global.on_mobile = ( ( os_type != os_windows ) and ( os_type != os_macosx ) and ( os_type != os_linux ) );
global.on_browser = !( os_browser == browser_not_a_browser );

vertex_buffer_definitions();

instance_create_depth( 0, 0, 0, obj_sizer );
instance_create_depth( 0, 0, 0, obj_screen );
instance_create_depth( 0, 0, 0, obj_sound_manager );
instance_create_depth( 0, 0, 0, obj_debug );

global.vbf_cube   = vertex_create_buffer_from_obj( "cube.obj"  , global.vft_simple,   false, false,   4, 0,  4, 1 );
global.vbf_spiral = vertex_create_buffer_from_obj( "spiral.obj", global.vft_simple,   false,  true,   1, 0, -1, 6 );

room_goto_next();