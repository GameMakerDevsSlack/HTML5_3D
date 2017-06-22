/// @param shader

global.lighting_instance = id;

lighting_shader = argument0;
lighting_vAmbientColour = shader_get_uniform( lighting_shader, "u_vAmbientColour" );
for( var _light = 0; _light < 8; _light++ ) {
	lighting_vLightPosRange[_light] = shader_get_uniform( lighting_shader, "u_vLightPosRange" + string( _light ) );
	lighting_vLightColour[_light]   = shader_get_uniform( lighting_shader, "u_vLightColour" + string( _light ) );
}