if ( keyboard_check_pressed( ord( "1" ) ) ) debug_visible = !debug_visible;

ds_list_add( lst_frame_time, obj_screen.frame_time );
ds_list_delete( lst_frame_time, 0 );
ds_list_add( lst_smoothed_timer, obj_screen.smoothed_timer );
ds_list_delete( lst_smoothed_timer, 0 );