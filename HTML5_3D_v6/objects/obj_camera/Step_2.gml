if ( keyboard_check( vk_escape ) ) game_end();

var _click = mouse_check_button_pressed( mb_left );
var _space = keyboard_check_pressed( vk_space );

if ( global.on_browser ) {
    mouse_locked = mouse_is_locked();
    if ( _click ) and ( !mouse_locked ) mouse_lock();
    if ( _space ) and (  mouse_locked ) mouse_unlock();
    mouse_dx = mouse_get_delta_x();
    mouse_dy = mouse_get_delta_y();
} else {
    if ( _click ) mouse_locked = true;
    if ( _space ) mouse_locked = false;
    if ( mouse_locked ) {
        window_set_cursor( cr_none );
        mouse_dx = window_mouse_get_x() - window_get_width()*0.5;
        mouse_dy = window_mouse_get_y() - window_get_height()*0.5;
        window_mouse_set( window_get_width()*0.5, window_get_height()*0.5 );
    } else {
        window_set_cursor( cr_default );
    }
}
if ( !mouse_locked ) {
    mouse_dx = 0;
    mouse_dy = 0;
}

look_xy_angle -= mouse_dx/8;
look_pz_angle = clamp( look_pz_angle - mouse_dy/5, -89, 89 );

var _xy_cos = dcos( look_xy_angle );
var _xy_sin = dsin( look_xy_angle );
var _pz_cos = dcos( look_pz_angle );
var _pz_sin = dsin( look_pz_angle );

look_x = x + _xy_cos*_pz_cos;
look_y = y - _xy_sin*_pz_cos;
look_z = z + _pz_sin;

audio_listener_position( x, y, z );
audio_listener_set_orientation( 0,   look_x-x, look_y-y, look_z-z,   0, 0, -1 );