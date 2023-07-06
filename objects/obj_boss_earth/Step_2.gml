var atpos = audio_sound_get_track_position(boss_music);
if ( atpos > 0 && atpos < .1 )
{
	if ( irandom_range(-1, 1) && play_flute )
	{
		con_audio.play_sound(msc_flute, .25);
	}
	play_flute = false;
}
else
{
	play_flute = true;	
}

if ( hp <= 0 )
{
	instance_destroy();
}	