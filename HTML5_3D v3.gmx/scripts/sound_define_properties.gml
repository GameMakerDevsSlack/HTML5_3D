///sound_define_properties( sound, reverb sound, max volume, min vol dist, max vol dist, vol bias, reverb min, reverb max, min reverb dist, max reverb dist, reverb bias, pan amount )

enum e_sound { left_sound, right_sound, reverb_sound,
               max_volume, min_vol_dist, max_vol_dist, vol_bias,
               min_reverb, max_reverb, min_reverb_dist, max_reverb_dist, reverb_bias,
               pan_amount }

var _result;
_result[e_sound.left_sound     ] =  argument0; //left sound
_result[e_sound.right_sound    ] =  argument1; //right sound
_result[e_sound.reverb_sound   ] =  argument2; //reverb sound
_result[e_sound.max_volume     ] =  argument3; //maximum volume
_result[e_sound.min_vol_dist   ] =  argument4; //minimum volume distance threshold. closer than this will set volume=100%
_result[e_sound.max_vol_dist   ] =  argument5; //maximum volume distance threshold. further than this will set volume=0%
_result[e_sound.vol_bias       ] =  argument6; //volume curve bias. see http://www.gmlscripts.com/script/bias (0.5 is linear)
_result[e_sound.min_reverb     ] =  argument7; //minimum reverb amount
_result[e_sound.max_reverb     ] =  argument8; //maximum reverb amount
_result[e_sound.min_reverb_dist] =  argument9; //minimum reverb distance threshold. closer than this will set reverb to the minimum value
_result[e_sound.max_reverb_dist] = argument10; //maximum reverb distance threshold. further than this will set reverb to the maximum value
_result[e_sound.reverb_bias    ] = argument11; //reverb curve bias. see http://www.gmlscripts.com/script/bias (0.5 is linear)
_result[e_sound.pan_amount     ] = argument12; //pan amount
return _result;
