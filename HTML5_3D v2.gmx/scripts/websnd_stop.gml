///websnd_stop( sound properties )

if ( in_browser() ) {
    wa_pause_sound( argument0[e_websnd.sound] );
    argument0[@e_websnd.playing] = false;
}
