if ( keyboard_check( ord( "Q" ) ) ) z += 2;
if ( keyboard_check( ord( "E" ) ) ) z -= 2;

var _vpara = 0;
var _vperp = 0;
if ( keyboard_check( ord( "A" ) ) ) _vperp = -acceleration;
if ( keyboard_check( ord( "D" ) ) ) _vperp =  acceleration;
if ( keyboard_check( ord( "W" ) ) ) _vpara =  acceleration;
if ( keyboard_check( ord( "S" ) ) ) _vpara = -acceleration;

if ( _vpara != 0 ) {
    velocity_x += lengthdir_x( _vpara, obj_camera.look_xy_angle );
    velocity_y += lengthdir_y( _vpara, obj_camera.look_xy_angle );
}

if ( _vperp != 0 ) {
    velocity_x += lengthdir_x( _vperp, obj_camera.look_xy_angle-90 );
    velocity_y += lengthdir_y( _vperp, obj_camera.look_xy_angle-90 );
}

velocity_x *= damping;
velocity_y *= damping;

if ( !place_meeting( x + velocity_x, y + velocity_y, obj_block ) ) {
    
    x += velocity_x;
    y += velocity_y;
    
} else {
    
    var _sign_x = sign( velocity_x );
    repeat( abs( velocity_x ) ) {
        if ( !place_meeting( x + _sign_x, y, obj_block ) ) {
            x += _sign_x;
        } else {
            break;
        }
    }
    
    var _sign_y = sign( velocity_y );
    repeat( abs( velocity_y ) ) {
        if ( !place_meeting( x, y + _sign_y, obj_block ) ) {
            y += _sign_y;
        } else {
            break;
        }
    }

}

with( obj_camera ) {
    x = other.x;
    y = other.y;
	z = other.z;
}