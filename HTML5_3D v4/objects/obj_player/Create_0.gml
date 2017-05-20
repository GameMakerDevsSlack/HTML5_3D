z = 50;
if ( !instance_exists( obj_camera ) ) {
    var _inst = instance_create_depth( x, y, 0, obj_camera );
    _inst.z = z;
}

acceleration = 0.42;
damping = 0.9;
velocity_x = 0;
velocity_y = 0;
velocity_z = 0;