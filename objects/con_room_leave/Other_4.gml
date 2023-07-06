if ( triggered )
{
	if ( instance_exists(obj_player) )
	{
		instance_destroy(obj_player);	
	}
	
	instance_create_layer(xto, yto, layer_get_id("Instances"), obj_player);
	instance_destroy();
}

if ( !instance_exists(obj_alternate_ending_effects) )
{
	if ( !audio_is_playing(msc_main) )
	{
		con_audio.play_sound(msc_main, 1, 1, 0, 1);
	}
	else
	{
		if ( audio_is_playing(msc_drums) )
		{
			audio_sound_gain(msc_main, 0, 100);	
		}
		else
		{
			audio_sound_gain(msc_main, 1, 1000);
		}	
	}
}
else
{
	audio_stop_sound(msc_main);	
}