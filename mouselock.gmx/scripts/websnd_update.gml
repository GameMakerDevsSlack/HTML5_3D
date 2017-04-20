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

if ( !_properties[@e_websnd.playing] ) exit;

var _distance = point_distance_3d( _x1, _y1, _z1, _x2, _y2, _z2 );

var _volume = lerp( 0, _properties[e_websnd.max_volume], websnd_falloff_curve( _distance,
                                                                               _properties[e_websnd.min_vol_dist],
                                                                               _properties[e_websnd.max_vol_dist],
                                                                               _properties[e_websnd.vol_bias] ) );

var _reverb = lerp( _properties[e_websnd.max_reverb], _properties[e_websnd.min_reverb], websnd_falloff_curve( _distance,
                                                                                                              _properties[e_websnd.min_reverb_dist],
                                                                                                              _properties[e_websnd.max_reverb_dist],
                                                                                                              _properties[e_websnd.reverb_bias] ) );

var _pan = fixed_dot_product_3d_normalised( _y1 - _ly, _lx - _x1,         0,
                                            _x2 - _x1, _y2 - _y1, _z2 - _z1 );

_properties[@e_websnd.calc_distance] = _distance;
_properties[@e_websnd.calc_volume  ] = _volume;
_properties[@e_websnd.calc_reverb  ] = _reverb;
_properties[@e_websnd.pan          ] = _pan;

if ( in_browser() ) {
    wa_set_volume(          _properties[e_websnd.sound        ], _volume );
    wa_set_effect_property( _properties[e_websnd.reverb_effect], "mix", _reverb );
    wa_set_effect_property( _properties[e_websnd.pan_effect   ], "pan", _pan );
}
