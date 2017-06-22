#macro SCALE_FACTOR 1
#macro RESTRICT_H 0
#macro RESTRICT_V 0
#macro PROPORTIONAL 1
#macro MIN_WIDTH 0
#macro MAX_WIDTH 0
#macro MIN_HEIGHT 0
#macro MAX_HEIGHT 0
#macro ALIGN_H fa_center
#macro ALIGN_V fa_middle

instance = id;
last_room = noone;
return_room = noone;

last_room = -1;
priority = 0;
min_x_scale = 0;
max_x_scale = 0;
min_y_scale = 0;
max_y_scale = 0;
dpi = 1;

no_flip = 1;
do_refresh = true;
do_flip = false;

js_add( "resized", "var r = window.js_resized; window.js_resized = 0; return r;" );
js_add( "dpi_scale", "return window.devicePixelRatio || 1;" );
js_add3( "set_size", "_id", "_w", "_h", "var _canvas = document.getElementById( _id ); _canvas.style.width = _w + 'px'; _canvas.style.height = _h + 'px';" );
js_add1( "scroll_down", "height", "document.getElementById( 'gm4html5_div_id' ).style.height = ~~( height + 128 ) + 'px'; window.scrollTo( 0, 1 );")

var _disp_w = display_get_width();
var _disp_h = display_get_height()
var _game_w = game_width()
var _game_h = game_height()

if ( global.on_mobile ) {
	
	var _x_ratio = _disp_w/_game_w;
	var _y_ratio = _disp_h/_game_h;
   
	max_x_scale = min( _x_ratio, _y_ratio );
	
	if ( max_x_scale == _y_ratio ) and ( _game_w < _game_h ) and ( room != rm_flip ) {
		if ( _x_ratio - _y_ratio <= 0.10416667 ) max_x_scale = _x_ratio;
	}
   
	max_y_scale = max_x_scale;
}