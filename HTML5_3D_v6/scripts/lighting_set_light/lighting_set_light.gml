/// @param light_id
/// @param x
/// @param y
/// @param z
/// @param range
/// @param colour
/// @param alpha

var _light  = argument0;
var _x      = argument1;
var _y      = argument2;
var _z      = argument3;
var _range  = argument4;
var _colour = argument5;
var _alpha  = argument6;

if ( _light >= 8 ) {
	show_debug_message( "lighting_set_light: WARNING light index has exceeded {7}" );
	return false;
}

with( global.lighting_instance ) {
	shader_set_uniform_f( lighting_vLightPosRange[_light], _x, _y, _z, _range );
	shader_set_uniform_f( lighting_vLightColour[_light]  , colour_get_red(   _colour )/255,
			                                               colour_get_green( _colour )/255,
														   colour_get_blue(  _colour )/255,
														   _alpha );
}

return true;