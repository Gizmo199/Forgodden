if ( audio_is_playing(msc_drums) && room != rm_boss_to )
{
	audio_stop_sound(msc_drums);
}
con_audio.play_sound(msc_drums_end);

with ( obj_rock_small ) instance_destroy();
with ( obj_rock_big ) instance_destroy();
