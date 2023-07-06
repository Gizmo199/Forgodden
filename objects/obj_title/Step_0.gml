image_xscale -= .0005;
image_yscale = image_xscale;
image_alpha -= 0.005;

if ( image_alpha < -.5 )
{
	room_goto(rm_tutorial);	
}

if ( image_alpha < .5 )
{
	if ( !audio_is_playing(msc_main) )
	{
		var aud = con_audio.play_sound(msc_main);
		audio_sound_gain(aud, 0, 0);
		audio_sound_gain(aud, 1, 10000);
	}
}