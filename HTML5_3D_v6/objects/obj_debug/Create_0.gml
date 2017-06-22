if ( !DEBUG ) {
    instance_destroy();
    exit;
}

persistent = true;
debug_visible = false;

lst_frame_time = ds_list_create();
repeat( 100 ) ds_list_add( lst_frame_time, 0 );

lst_smoothed_timer = ds_list_create();
repeat( 100 ) ds_list_add( lst_smoothed_timer, 0 );