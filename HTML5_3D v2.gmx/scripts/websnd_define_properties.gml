///websnd_define_properties( sound, pan effect, reverb effect, max volume, min vol dist, max vol dist, vol bias, reverb min, reverb max, min reverb dist, max reverb dist, reverb bias )

enum e_websnd { sound, pan_effect, reverb_effect,
                max_volume, min_vol_dist, max_vol_dist, vol_bias,
                min_reverb, max_reverb, min_reverb_dist, max_reverb_dist, reverb_bias,
                calc_distance, calc_volume, calc_reverb,
                pan, playing }

var _result;
_result[e_websnd.sound          ] =  argument0; //sound (as defined by wa_create_sound)
_result[e_websnd.pan_effect     ] =  argument1; //sound (as defined by wa_create_sound)
_result[e_websnd.reverb_effect  ] =  argument2; //sound (as defined by wa_create_sound)
_result[e_websnd.max_volume     ] =  argument3; //maximum volume
_result[e_websnd.min_vol_dist   ] =  argument4; //minimum volume distance threshold. closer than this will set volume=100%
_result[e_websnd.max_vol_dist   ] =  argument5; //maximum volume distance threshold. further than this will set volume=0%
_result[e_websnd.vol_bias       ] =  argument6; //volume curve bias. see http://www.gmlscripts.com/script/bias (0.5 is linear)
_result[e_websnd.min_reverb     ] =  argument7; //minimum reverb amount
_result[e_websnd.max_reverb     ] =  argument8; //maximum reverb amount
_result[e_websnd.min_reverb_dist] =  argument9; //minimum reverb distance threshold. closer than this will set reverb to the minimum value
_result[e_websnd.max_reverb_dist] = argument10; //maximum reverb distance threshold. further than this will set reverb to the maximum value
_result[e_websnd.reverb_bias    ] = argument11; //reverb curve bias. see http://www.gmlscripts.com/script/bias (0.5 is linear)
_result[e_websnd.calc_distance  ] = VERY_LARGE;
_result[e_websnd.calc_volume    ] = 0;
_result[e_websnd.calc_reverb    ] = 0;
_result[e_websnd.pan            ] = 0;
_result[e_websnd.playing        ] = false;
return _result;
