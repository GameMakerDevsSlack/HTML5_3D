/// @param light_id
/// @param x
/// @param y
/// @param z
/// @param range
/// @param colour
/// @param alpha

var _light_id = argument0;
var _x        = argument1;
var _y        = argument2;
var _z        = argument3;
var _range    = argument4;
var _colour   = argument5;
var _alpha    = argument6;

shader_set_uniform_f( shader_get_uniform( shd_psx, "u_vLightPosRange" + string( _light_id ) ), _x, _y, _z, _range );
shader_set_uniform_f( shader_get_uniform( shd_psx, "u_vLightColour" + string( _light_id ) ), colour_get_red(   _colour )/255,
		                                                                                     colour_get_green( _colour )/255,
																		                     colour_get_blue(  _colour )/255,
																		                     _alpha );