///render_queue_add_self()

if ( global.render_pass == e_render.zwrite ) {
    global.render_queue[ global.render_queue_size ] = id;
    global.render_queue_size++;
}
