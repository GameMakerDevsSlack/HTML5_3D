global.sizer_browser_width = 0;
global.sizer_browser_height = 0;
global.sizer_last_room = noone;
global.sizer_return_room = noone;

global.sizer_browser_width = 0;
global.sizer_browser_height = 0;
global.sizer_last_room = -1;
global.sizer_priority = 0;
global.sizer_min_x_scale = 0;
global.sizer_max_x_scale = 0;
global.sizer_min_y_scale = 0;
global.sizer_max_y_scale = 0;
global.sizer_dpi = 1;

global.sizer_no_flip = 1;
global.sizer_do_refresh = true;
global.sizer_do_flip = false;

js_add( "resized", "var r = window.js_resized; window.js_resized = 0; return r;" );
js_add( "dpi_scale", "return window.devicePixelRatio || 1;" );
js_add3( "set_size", "id", "w", "h", "var c = document.getElementById(id); c.style.width = w + 'px'; c.style.height = h + 'px';" );

var _disp_w = display_get_width();
var _disp_h = display_get_height()
var _game_w = game_width()
var _game_h = game_height()

if ( global.on_mobile ) {
	
	var _x_ratio = _disp_w/_game_w;
	var _y_ratio = _disp_h/_game_h;
   
	global.sizer_max_x_scale = min( _x_ratio, _y_ratio );
	
	if ( global.sizer_max_x_scale == _y_ratio ) and ( _game_w < _game_h ) and ( room != rm_flip ) {
		if ( _x_ratio - _y_ratio <= 0.10416667 ) global.sizer_max_x_scale = _x_ratio;
	}
   
	global.sizer_max_y_scale = global.sizer_max_x_scale;
}
