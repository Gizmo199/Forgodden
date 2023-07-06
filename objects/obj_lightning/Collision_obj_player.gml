with ( other )
{
	player_die();
	audio_stop_sound(snd_thunder);
	var aud = con_audio.play_sound(snd_thunder, .5, 2);
	audio_sound_gain(aud, 0, 5000);
}