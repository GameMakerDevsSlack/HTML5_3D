///websnd_play( sound properties )

if ( in_browser() ) {
    wa_play_sound( argument0[e_websnd.sound] );
    argument0[@e_websnd.playing] = true;
}
