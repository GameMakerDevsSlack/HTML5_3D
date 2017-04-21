///websnd_define_properties( sound, reverb sound, max volume, min vol dist, max vol dist, vol bias, reverb min, reverb max, min reverb dist, max reverb dist, reverb bias, pan amount )

enum e_websnd { sound, reverb_sound,
                max_volume, min_vol_dist, max_vol_dist, vol_bias,
                min_reverb, max_reverb, min_reverb_dist, max_reverb_dist, reverb_bias,
                calc_distance, calc_volume, calc_reverb,
                pan, pan_amount, playing }

var _result;
_result[e_websnd.sound          ] =  argument0; //sound (as defined by wa_create_sound)
_result[e_websnd.reverb_sound   ] =  argument1; //sound (as defined by wa_create_sound)
_result[e_websnd.max_volume     ] =  argument2; //maximum volume
_result[e_websnd.min_vol_dist   ] =  argument3; //minimum volume distance threshold. closer than this will set volume=100%
_result[e_websnd.max_vol_dist   ] =  argument4; //maximum volume distance threshold. further than this will set volume=0%
_result[e_websnd.vol_bias       ] =  argument5; //volume curve bias. see http://www.gmlscripts.com/script/bias (0.5 is linear)
_result[e_websnd.min_reverb     ] =  argument6; //minimum reverb amount
_result[e_websnd.max_reverb     ] =  argument7; //maximum reverb amount
_result[e_websnd.min_reverb_dist] =  argument8; //minimum reverb distance threshold. closer than this will set reverb to the minimum value
_result[e_websnd.max_reverb_dist] =  argument9; //maximum reverb distance threshold. further than this will set reverb to the maximum value
_result[e_websnd.reverb_bias    ] = argument10; //reverb curve bias. see http://www.gmlscripts.com/script/bias (0.5 is linear)
_result[e_websnd.pan_amount     ] = argument11; //pan amount
_result[e_websnd.calc_distance  ] = VERY_LARGE;
_result[e_websnd.calc_volume    ] = 0;
_result[e_websnd.calc_reverb    ] = 0;
_result[e_websnd.pan            ] = 0;
_result[e_websnd.playing        ] = false;
return _result;
