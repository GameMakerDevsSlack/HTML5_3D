#define mouse_lock
if (!global.g_mouse_locked) {
	global.g_mouse_locked = true;
	global.g_mouse_lock_lcr = window_get_cursor();
	if (global.g_mouse_lock_lcr != cr_none) window_set_cursor(cr_none);
	global.g_mouse_lock_lx = window_mouse_get_x();
	global.g_mouse_lock_ly = window_mouse_get_y();
}

#define mouse_unlock
if (global.g_mouse_locked) {
	global.g_mouse_locked = false;
	window_set_cursor(global.g_mouse_lock_lcr);
	window_mouse_set(global.g_mouse_lock_lx, global.g_mouse_lock_ly);
}

#define mouse_get_delta_x
return global.g_mouse_delta_x;

#define mouse_get_delta_y
return global.g_mouse_delta_y;

#define mouse_is_locked
return global.g_mouse_locked && window_has_focus();

#define mouse_lock_update
var locked = mouse_is_locked();
global.g_mouse_delta_x = 0;
global.g_mouse_delta_y = 0;
if (locked) {
	var nx = window_get_width() div 2;
	var ny = window_get_height() div 2;
	if (global.g_mouse_was_locked) {
		global.g_mouse_delta_x = window_mouse_get_x() - nx;
		global.g_mouse_delta_y = window_mouse_get_y() - ny;
	}
	window_mouse_set(nx, ny);
}
global.g_mouse_was_locked = locked;

#define mouse_lock_init
global.g_mouse_delta_x = 0;
global.g_mouse_delta_y = 0;
global.g_mouse_locked = false;
global.g_mouse_was_locked = false;
global.g_mouse_lock_lcr = cr_default;
global.g_mouse_lock_lx = 0;
global.g_mouse_lock_ly = 0;
