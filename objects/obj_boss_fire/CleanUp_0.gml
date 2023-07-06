if ( audio_is_playing(msc_drums) && room != rm_boss_to )
{
	audio_stop_sound(msc_drums);
}
con_audio.play_sound(msc_drums_end);
audio_stop_sound(fire_audio);

con_audio.play_sound(snd_phoenix);