with ( obj_player )
{
	player_win();
}
with ( obj_tornado ) instance_destroy();
with ( obj_tornado_nonwall ) instance_destroy();
with ( obj_raindrop) instance_destroy();
with ( obj_charge ) instance_destroy();
with ( obj_lightning ) instance_destroy();
with ( obj_fire_pit ) on = false;
instance_destroy();

if ( room == rm_boss_to )
{
	with ( obj_boss_doppleganger )
	{
		stop_when_in_area = true;
		sprite_index = sp_doppleganger_beat;
		
		if ( !global._humanSaved )
		{
			instance_create_layer(x, y, layer, obj_alternate_ending_effects);
		}
	}	
}
else
{
	if ( !audio_is_playing(msc_main) )
	{
		var aud = con_audio.play_sound(msc_main, 0, 1, 0, true);
		audio_sound_gain(aud, 1, 10000);
	}	
}
