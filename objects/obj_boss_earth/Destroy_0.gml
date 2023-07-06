if ( !audio_is_playing(msc_main) )
{
	var aud = con_audio.play_sound(msc_main, 0, 1, 0, true);
	audio_sound_gain(aud, 1, 10000);
}