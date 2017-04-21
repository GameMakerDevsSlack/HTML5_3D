///render_queue_get_texture( sprite, image )

if ( global.render_pass == e_render.zwrite ) return global.render_zsurf_texture;
return sprite_get_texture( argument0, argument1 );
