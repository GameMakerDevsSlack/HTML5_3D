///sound_instance_play( properties, priority )

enum e_sound_instance { properties, left_instance, right_instance, reverb_instance, distance, volume, reverb, pan }

var _properties = argument0;
var _priority   = argument1;

var _instance;
_instance[e_sound_instance.properties     ] = argument0;
_instance[e_sound_instance.left_instance  ] = audio_play_sound( _properties[e_sound.left_sound], _priority, false );
_instance[e_sound_instance.right_instance ] = audio_play_sound( _properties[e_sound.right_sound], _priority, false );
_instance[e_sound_instance.reverb_instance] = audio_play_sound( _properties[e_sound.reverb_sound], _priority, false );
_instance[e_sound_instance.distance       ] = VERY_LARGE;
_instance[e_sound_instance.volume         ] = 0;
_instance[e_sound_instance.reverb         ] = 0;
_instance[e_sound_instance.pan            ] = 0;
return _instance;
