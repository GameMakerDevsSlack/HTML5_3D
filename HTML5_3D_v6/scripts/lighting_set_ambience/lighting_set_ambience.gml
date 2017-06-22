/// @param red
/// @param green
/// @param blue
/// @param alpha

var _red   = argument0;
var _green = argument1;
var _blue  = argument2;
var _alpha = argument3;

with( global.lighting_instance ) {
	shader_set_uniform_f( lighting_vAmbientColour, _red/255, _green/255, _blue/255, _alpha );
}