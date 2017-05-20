persistent = true;

smoothed_timer   = 5000;
frame_start_time = get_timer();
frame_time       = 0;
do_lighting      = true;
do_dither        = true;

global.dither_surface = dither_make_surface();
global.dither_texture = surface_get_texture( global.dither_surface );