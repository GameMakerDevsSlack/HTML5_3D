///websnd_update( sound properties, listener x, y, z, look x, y, z, sound x, y, z )

//enum e_websnd { sound, max_volume, min_vol_dist, max_vol_dist, vol_bias, min_reverb, max_reverb, min_reverb_dist, max_reverb_dist, reverb_bias }

var _properties = argument0;
var _x1         = argument1;
var _y1         = argument2;
var _z1         = argument3;
var _lx         = argument4;
var _ly         = argument5;
var _lz         = argument6;
var _x2         = argument7;
var _y2         = argument8;
var _z2         = argument9;

var _distance = point_distance_3d( _x1, _y1, _z1, _x2, _y2, _z2 );

var _volume = lerp( 0, _properties[e_websnd.max_volume], websnd_falloff_curve( _distance,
                                                                               _properties[e_websnd.min_vol_dist],
                                                                               _properties[e_websnd.max_vol_dist],
                                                                               _properties[e_websnd.vol_bias] ) );

var _reverb = lerp( _properties[e_websnd.max_reverb], _properties[e_websnd.min_reverb], websnd_falloff_curve( _distance,
                                                                                                              _properties[e_websnd.min_reverb_dist],
                                                                                                              _properties[e_websnd.max_reverb_dist],
                                                                                                              _properties[e_websnd.reverb_bias] ) );


/*
var _rx = _y1*_z2 - _z1*_y2;
var _ry = _z1*_x2 - _x1*_z2;
var _rz = _x1*_y2 - _y1*_x2;
var _r = 1/sqrt( _rx*_rx + _ry*_ry + _rz*_rz );
*/
/*
var _forward_x = _lx - _x1;
var _forward_y = _ly - _y1;
var _forward_z = _lz - _z1;

var _sound_x = _x2 - _x1;
var _sound_y = _y2 - _y1;
var _sound_z = _z2 - _z1;

var _rx = -_forward_y;
var _ry =  _forward_x;
*/
var _pan = fixed_dot_product_3d_normalised( _y1 - _ly, _lx - _x1,         0,
                                            _x2 - _x1, _y2 - _y1, _z2 - _z1 );
/*
var _r = 1/sqrt( _rx*_rx + _ry*_ry );
var _s = 1/sqrt( _sound_x*_sound_x + _sound_y*_sound_y + _sound_z*_sound_z );
_rx *= _r;
_ry *= _r;
_sound_x *= _s;
_sound_y *= _s;
_sound_z *= _s;
*/
//var _pan = /*_rx*_sound_x + _ry*_sound_y;*/ fixed_dot_product_3d_normalised( _rx, _ry, 0, _sound_x, _sound_y, _sound_z );

_properties[@e_websnd.calc_distance] = _distance;
_properties[@e_websnd.calc_volume  ] = _volume;
_properties[@e_websnd.calc_reverb  ] = _reverb;
_properties[@e_websnd.pan          ] = _pan;

if ( in_browser() ) {
    wa_set_volume(          _properties[e_websnd.sound        ], _volume );
    wa_set_effect_property( _properties[e_websnd.reverb_effect], "mix", _reverb );
    wa_set_effect_property( _properties[e_websnd.pan_effect   ], "pan", _pan );
}
