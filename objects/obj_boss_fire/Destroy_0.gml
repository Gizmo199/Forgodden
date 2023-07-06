with ( obj_boss_phoenix_flame ) instance_destroy();
with ( obj_boss_fire_section) instance_destroy();
with ( obj_fire_pit ) { on = false; triggered = false; }

alarm[0] = -1;
alarm[1] = -1;

if ( !audio_is_playing(msc_main) )
{
	var aud = con_audio.play_sound(msc_main, 0, 1, 0, true);
	audio_sound_gain(aud, 1, 10000);
}