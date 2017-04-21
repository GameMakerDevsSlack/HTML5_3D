///sound_instance_update( sound properties, listener x, y, z, look x, y, z, sound x, y, z )

var _instance = argument0;
var _x1       = argument1;
var _y1       = argument2;
var _z1       = argument3;
var _lx       = argument4;
var _ly       = argument5;
var _lz       = argument6;
var _x2       = argument7;
var _y2       = argument8;
var _z2       = argument9;

var _properties = _instance[e_sound_instance.properties];

var _distance = point_distance_3d( _x1, _y1, _z1, _x2, _y2, _z2 );

var _volume = lerp( 0, _properties[e_sound.max_volume], sound_falloff_curve( _distance,
                                                                             _properties[e_sound.min_vol_dist],
                                                                             _properties[e_sound.max_vol_dist],
                                                                             _properties[e_sound.vol_bias] ) );

var _reverb = lerp( _properties[e_sound.max_reverb], _properties[e_sound.min_reverb], sound_falloff_curve( _distance,
                                                                                                           _properties[e_sound.min_reverb_dist],
                                                                                                           _properties[e_sound.max_reverb_dist],
                                                                                                           _properties[e_sound.reverb_bias] ) );

var _pan = fixed_dot_product_3d_normalised( _y1-_ly, _lx-_x1,       0,
                                            _x2-_x1, _y2-_y1, _z2-_z1 ) * _properties[e_sound.pan_amount];

_instance[@e_sound_instance.distance] = _distance;
_instance[@e_sound_instance.volume  ] = _volume;
_instance[@e_sound_instance.reverb  ] = _reverb;
_instance[@e_sound_instance.pan     ] = _pan;

var _gain  = lerp( _volume, 0, _reverb );
audio_sound_gain( _instance[e_sound_instance.left_instance  ], lerp( _gain, 0, 0.5 + 0.5*_pan ), 0 );
audio_sound_gain( _instance[e_sound_instance.right_instance ], lerp( 0, _gain, 0.5 + 0.5*_pan ), 0 );
audio_sound_gain( _instance[e_sound_instance.reverb_instance], lerp( 0, _volume, _reverb ), 0 );
